using ThoughtWorksMingleLib;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Security;
using System.Collections.Generic;

namespace Tests
{
    
    
    /// <summary>
    ///This is a test class for MingleServerIntegrationTest and is intended
    ///to contain all MingleServerIntegrationTest Unit Tests
    ///</summary>
    [TestClass()]
    public class MingleServerIntegrationTest
    {


        private TestContext testContextInstance;

        /// <summary>
        ///Gets or sets the test context which provides
        ///information about and functionality for the current test run.
        ///</summary>
        public TestContext TestContext
        {
            get
            {
                return testContextInstance;
            }
            set
            {
                testContextInstance = value;
            }
        }

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
        ///A test for GetProjectList
        ///</summary>
        [TestMethod()]
        public void GetProjectListIntegrationTest()
        {
            string hostUrl = "http://localhost:8080"; // TODO: Initialize to an appropriate value
            string loginName = "mingleuser"; // TODO: Initialize to an appropriate value
            string password = "secret"; // TODO: Initialize to an appropriate value
            MingleServer target = new MingleServer(hostUrl, loginName, password); // TODO: Initialize to an appropriate value
            SortedList<string, string> expected = null; // TODO: Initialize to an appropriate value
            SortedList<string, string> actual;
            actual = target.GetProjectList();
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }
    }
}
