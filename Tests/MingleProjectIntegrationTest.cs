﻿using System.Linq;
using ThoughtWorksMingleLib;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;

namespace Tests
{
    
    
    /// <summary>
    ///This is a test class for MingleProjectIntegrationTest and is intended
    ///to contain all MingleProjectIntegrationTest Unit Tests
    ///</summary>
    [TestClass()]
    public class MingleProjectIntegrationTest
    {
        /// <summary>
        ///Gets or sets the test context which provides
        ///information about and functionality for the current test run.
        ///</summary>
        public TestContext TestContext { get; set; }

        #region Additional test attributes
        // 
        //You can use the following additional attributes as you write your tests:
        //
        //Use ClassInitialize to run code before running the first test in the class
        //[ClassInitialize()]
        //public static void MyClassInitialize(TestContext testContext)
        //{
        //}
        //
        //Use ClassCleanup to run code after all tests in a class have run
        //[ClassCleanup()]
        //public static void MyClassCleanup()
        //{
        //}
        //
        //Use TestInitialize to run code before running each test
        //[TestInitialize()]
        //public void MyTestInitialize()
        //{
        //}
        //
        //Use TestCleanup to run code after each test has run
        //[TestCleanup()]
        //public void MyTestCleanup()
        //{
        //}
        //
        #endregion


        /// <summary>
        ///A test for GetView
        ///</summary>
        [TestMethod()]
        [TestCategory("Unit")]
        public void GetViewIntegrationTest()
        {
            var target = new MingleServer("http://localhost:8080", "mingleuser", "secret").GetProject("apitest"); 
            var actual = target.GetView("Sprint List");
            Assert.AreEqual(25, actual.Count);
        }

        [TestMethod()]
        [TestCategory("Unit")]
        public void GetProjectList()
        {
            const string host = @"http://localhost:8080";
            const string user = "mingleuser";
            const string pw = "secret";
            var mingle = new MingleServer(host, user, pw);
            var depart = DateTime.Now;
            var list = mingle.GetProjectList();
            var duration = (DateTime.Now - depart).TotalSeconds;
            Console.WriteLine(string.Format("Time spent in GetProjectList: {0} seconds.", duration));
            Assert.AreEqual(2,list.Count);
        }

        [TestMethod]
        [TestCategory("Unit")]
        public void TestPostMurmur()
        {
            const string host = @"http://localhost:8080";
            const string user = "mingleuser";
            const string pw = "secret";
            var project = new MingleServer(host, user, pw).GetProject("apitest");
            var ticks = DateTime.Now.Ticks;
            Assert.AreEqual(ticks.ToString(),project.SendMurmur(ticks.ToString()).Body);
        }

        [TestMethod]
        [TestCategory("Unit")]
        public void TestGetCards()
        {
            const string host = @"http://localhost:8080";
            const string user = "mingleuser";
            const string pw = "secret";
            var project = new MingleServer(host, user, pw).GetProject("apitest");
            Assert.AreEqual(88, project.GetCards().Count);
            Assert.AreEqual(36, project.GetCards(new Collection<string>{"[filters[]=[Type][Is][Story]"}).Count);
        }

        [TestMethod]
        [TestCategory("Integration")]
        public void TestTypeInFilter()
        {
            const string host = @"http://localhost:8080";
            const string user = "mingleuser";
            const string pw = "secret";
            var filters = new Collection<string> { new MingleFilter("Type", "Is", "Main Business Requirement").FilterFormatString };
            filters.Add( new MingleFilter("Type", "Is", "Business Use Case").FilterFormatString );
            filters.Add( new MingleFilter("Type", "Is", "Planning Card").FilterFormatString );
            var project = new MingleServer(host, user, pw).GetProject("bss_portfolio_sandbox");
            Assert.AreEqual(314, project.GetCards(filters).Count);
        }
    }
}
