using ThoughtWorksMingleLib;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;

namespace Tests
{
    
    
    /// <summary>
    ///This is a test class for MingleProjectIntegrationTest and is intended
    ///to contain all MingleProjectIntegrationTest Unit Tests
    ///</summary>
    [TestClass()]
    public class MingleProjectIntegrationTest
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
        ///A test for GetView
        ///</summary>
        [TestMethod()]
        public void GetViewIntegrationTest()
        {
            var target = new MingleServer("http://localhost:8080", "mingleuser", "secret").GetProject("apitest"); 
            var actual = target.GetView("Sprint List");
            Assert.AreEqual(25, actual.Count);
        }
    }
}
