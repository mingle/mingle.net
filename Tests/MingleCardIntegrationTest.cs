using ThoughtWorksMingleLib;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;

namespace Tests
{
    
    
    /// <summary>
    ///This is a test class for MingleCardIntegrationTest and is intended
    ///to contain all MingleCardIntegrationTest Unit Tests
    ///</summary>
    [TestClass()]
    public class MingleCardIntegrationTest
    {


        private TestContext testContextInstance;
        private const string MINGLEHOST = "http://fmtstdsol01.thoughtworks.com:8080";
        private const string MINGLEUSER = "mingleuser";
        private const string MINGLEPASSWORD = "secret";

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
        ///A scenario test for Update
        ///</summary>
        [TestMethod()]
        public void UpdateIntegrationTest()
        {
            var mingle = new MingleServer(MINGLEHOST, MINGLEUSER, MINGLEPASSWORD);
            var card = mingle.GetProject("test").GetCard(117);
            Assert.IsInstanceOfType(card, typeof(MingleCard));
            Assert.AreEqual("Feature", card.Type);
        }
    }
}
