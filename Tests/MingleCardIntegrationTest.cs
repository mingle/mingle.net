using ThoughtWorksMingleLib;
using Microsoft.VisualStudio.TestTools.UnitTesting;

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
        private const string MINGLEHOST = "http://localhost:8080";
        private const string MINGLEUSER = "mingleuser";
        private const string MINGLEPASSWORD = "secret";
        private static MingleServer _mingle;
        private static MingleProject _project;

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
        [ClassInitialize()]
        public static void MyClassInitialize(TestContext testContext)
        {
            _mingle = new MingleServer(MINGLEHOST, MINGLEUSER, MINGLEPASSWORD);
            _project = _mingle.GetProject("test");
        }
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
        public void CreateIntegrationTest()
        {
            var project = _mingle.GetProject("test");
            var card = project.GetCard(4);
            Assert.IsInstanceOfType(card, typeof(MingleCard));
            Assert.AreEqual("Sprint 2", card.Name);
            var newCard = project.CreateCard("story", "make a new widget");
            Assert.AreEqual("Story", newCard.Type);
            var view = project.GetView("Sprint List");
            Assert.IsInstanceOfType(view, typeof(MingleCardCollection));
            Assert.AreEqual(view.Count, 7);
        }

        [TestMethod]
        public void CardPropertyIntegrationTest()
        {
            
        }
    }
}
