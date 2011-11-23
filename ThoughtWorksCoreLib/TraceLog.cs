//
//Copyright 2011 ThoughtWorks, Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License"); 
// you may not use this file except in compliance with the License. 
// You may obtain a copy of the License at:
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software 
// distributed under the License is distributed on an "AS IS" BASIS, 
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
// See the License for the specific language governing permissions and 
// limitations under the License.
//
using System;
using System.Collections;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.Net;
using ThoughtWorksCoreLib.Properties;

namespace ThoughtWorksCoreLib
{
	/// <summary>
	/// Maintains a log of application activity.
	/// </summary>
	public static class TraceLog
	{
		/// <summary>
		/// FileStream used to write the log to disc.
		/// </summary>
		private static FileStream _fs;

		/// <summary>
		/// Turn tracing logging on/off
		/// </summary>
		public static bool Tracing
		{
			get { return Convert.ToBoolean(Settings.Default.Trace); }
			set { Settings.Default.Trace = value; }
		}

		/// <summary>
		/// Turn method entry and exit logging on/off
		/// </summary>
		public static bool TraceEntryAndExit
		{
			get { return Convert.ToBoolean(Settings.Default.TraceEntryAndExit); }
			set { Settings.Default.TraceEntryAndExit = value; }
		}

		/// <summary>
		/// Initializes a new log
		/// </summary>
		/// <param name="appName">Name of the application</param>
		public static string Initialize(string appName)
		{
			if (!Convert.ToBoolean(Settings.Default.Trace, CultureInfo.InvariantCulture)) return string.Empty;

			// This is going in a "ThoughtWorks" folder under the directory that serves as a 
			// common repository for application-specific data that is used by the current, non-roaming user.
			var dir = Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData) +
						 "\\ThoughtWorks\\";

			var di = new DirectoryInfo(dir);
			di.Create();

			FilePath = string.Format("{0}{1}{2}{3}", dir, (string.IsNullOrEmpty(appName) ? string.Empty : appName), DateTime.Now.Ticks, ".log");
			_fs = new FileStream(FilePath, FileMode.Append);
			Log = new TextWriterTraceListener(_fs);
			Trace.Listeners.Add(Log);
			Log.IndentSize = 4;
			Log.WriteLine(string.Format("{0}*** Log opened at {1} ***", FilePath, DateTime.Now.ToLongTimeString()));
			return FilePath;
		}

		/// <summary>
		/// 
		/// </summary>
		private static TextWriterTraceListener Log { get; set; }

		/// <summary>
		/// FilePath of the log where tracing is written.
		/// </summary>
		public static string FilePath { get; set; }

		/// <summary>
		/// Works like Trace.WriteLine but also flushes cache
		/// </summary>
		/// <param name="methodName"></param>
		/// <param name="message"></param>
		public static void WriteLine(string methodName, string message)
		{
			if (!Convert.ToBoolean(Settings.Default.Trace)) return;
			if (!Settings.Default.TraceEntryAndExit && (message.Contains("Entering...") || message.Contains("Leaving..."))) return;
			if (null == Log) Initialize("test");
			Log.WriteLine(string.Format("{0} {1}.{2}: {3}", Convert.ToString(DateTime.Now),
										new StackTrace().GetFrame(1).GetMethod().ReflectedType.FullName, methodName,
										message));
			Log.Flush();
		}

		/// <summary>
		/// Logs details about an exception.
		/// </summary>
		/// <param name="methodName"></param>
		/// <param name="e"></param>
		/// <remarks>
		/// Recurses through a stack of InnerExceptions if needed.</remarks>
		public static void Exception(string methodName, Exception e)
		{
			if (!Convert.ToBoolean(Settings.Default.Trace, CultureInfo.InvariantCulture)) return;

			Log.WriteLine(
				string.Format(string.Format("{0} {1}.{2}: {3}", Convert.ToString(DateTime.Now),
											new StackTrace().GetFrame(1).GetMethod().ReflectedType.FullName, methodName,
											e.Message)));

		 switch (e.GetType().Name)
		 {
			 case "WebException":
			 Log.WriteLine(
				string.Format(string.Format("{0} {1}.{2}: {3}", Convert.ToString(DateTime.Now),
											new StackTrace().GetFrame(1).GetMethod().ReflectedType.FullName, methodName,
											((WebException)e).Status)));
			 break;
		 }

			foreach (DictionaryEntry kvp in e.Data)
				Log.WriteLine(
					string.Format(string.Format("{0} {1}.{2}: {3}", Convert.ToString(DateTime.Now),
												new StackTrace().GetFrame(1).GetMethod().ReflectedType.FullName,
												methodName, kvp.Value)));

			Log.WriteLine(
				string.Format(string.Format("{0} {1}.{2}: {3}", Convert.ToString(DateTime.Now),
											new StackTrace().GetFrame(1).GetMethod().ReflectedType.FullName, methodName,
											e.StackTrace)));
			Log.Flush();
		}
	}
}