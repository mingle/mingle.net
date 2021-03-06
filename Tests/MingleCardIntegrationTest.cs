﻿using System;
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
        public static string MingleHost
        {
            get
            {
                var mingleHost = Environment.GetEnvironmentVariable("MINGLETARGET");
                return string.IsNullOrEmpty(mingleHost) ? @"http://127.0.0.1:8080" : mingleHost;
            }
        }
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
            _mingle = new MingleServer(MingleHost, MINGLEUSER, MINGLEPASSWORD);
            _project = _mingle.GetProject("apitest");
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
        [TestCategory("Unit")]
        public void CreateIntegrationTest()
        {
            var card = _project.GetCard(4);
            Assert.IsInstanceOfType(card, typeof(MingleCard));
            Assert.AreEqual("Sprint 2", card.Name);
            var newCard = _project.CreateCard("story", "make a new widget");
            Assert.AreEqual("Story", newCard.Type);
            var view = _project.GetView("Sprint List");
            Assert.IsInstanceOfType(view, typeof(MingleCardCollection));
            Assert.AreEqual(view.Count, 7);
        }

        [TestMethod]
        [TestCategory("Unit")]
        public void CardPropertyIntegrationTest()
        {
            var card = _project.GetCard(120);
            card.AddPropertyFilterToPostData("bogus property", string.Empty);
            try
            {
                card.Update();
            }
            catch (System.Exception ex)
            {
                Assert.IsInstanceOfType(ex, typeof(MingleWebException));
                return;
            }
            Assert.Fail("Expected a MingleWebException and did not get an exception at all.");

        }

        [TestMethod]
        [TestCategory("Unit")]
        public void TestSetCardProperty()
        {
            var card = _project.GetCard(120);

            try
            {
                card.AddPropertyFilterToPostData("TestProperty", "");
                card.Update();
                Assert.AreEqual("", card.CardProperties["TestProperty"].Value);
                card.AddPropertyFilterToPostData("TestProperty", "test me");
                card.Update();
                Assert.AreEqual("test me", card.CardProperties["TestProperty"].Value);
                card.AddPropertyFilterToPostData("TestProperty", "");
                card.Update();
            }
            catch (System.Exception ex)
            {
                Assert.Fail(ex.Message);
                return;
            }
        }
         
        [TestMethod]
        [TestCategory("Unit")]
        public void TestSetCardPropertyWithTwoWordName()
        {
            var card = _project.GetCard(120);

            try
            {
                card.AddPropertyFilterToPostData("Two Word", "");
                card.Update();
                Assert.AreEqual("", card.CardProperties["Two Word"].Value);
                card.AddPropertyFilterToPostData("Two Word", "test me");
                card.Update();
                Assert.AreEqual("test me", card.CardProperties["Two Word"].Value);
                card.AddPropertyFilterToPostData("Two Word", "");
                card.Update();
            }
            catch (System.Exception ex)
            {
                Assert.Fail(ex.Message);
                return;
            }
            
        }

        [TestMethod]
        [TestCategory("Unit")]
        public void TestCardTransitions()
        {
            var project = _mingle.GetProject("test");
            var card = project.GetCard(91);
            var actual = card.Transitions.Count;
            const int expected = 4;
            Assert.AreEqual(expected, actual);
        }

        [TestMethod]
        [TestCategory("Unit")]
        public void TestCardUpdateName()
        {
            var card = _mingle.GetProject("test").GetCard(126);
            card.AddCardAttributeFilterToPostData("name", "xxx");
            card.Update();
            Assert.AreEqual("xxx", _mingle.GetProject("test").GetCard(126).Name);
            card.AddCardAttributeFilterToPostData("name", "ready to test");
            Assert.AreEqual("xxx", _mingle.GetProject("ready to test").GetCard(126).Name);
        }
    }
}
