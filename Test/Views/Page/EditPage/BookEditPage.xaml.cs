using System;
using System.Linq;
using System.Windows;
using Test.Models;
using Test.Models.Entity;

namespace Test.Views.Page.EditPage
{
    /// <summary>
    /// Логика взаимодействия для BookEditPage.xaml
    /// </summary>
    public partial class BookEditPage 
    {
        private readonly Book _currentBook;
        public BookEditPage()
        {
            InitializeComponent();
            _currentBook = new Book();
            _currentBook.Date = DateTime.Now;
            getComboBox();
            DataContext = _currentBook;
        }
        public BookEditPage(Book bo)
        {
            InitializeComponent();
            _currentBook = bo;
            getComboBox();
            DataContext = _currentBook;
        }
        public void getComboBox()
        {
            CBAuthor.ItemsSource = TestEntities.GetContext().Authors.ToList();
            CBGenre.ItemsSource = TestEntities.GetContext().Genres.ToList();
        }

        private void BntSave_Click(object sender, RoutedEventArgs e)
        {            
            if (string.IsNullOrWhiteSpace(TBName.Text) || CBGenre.SelectedItem == null) return;
            if (_currentBook.ID == 0)
                TestEntities.GetContext().Books.Add(_currentBook);
            try
            {
                var item = _currentBook.Genre;
                TestEntities.GetContext().SaveChanges();
                MessageBox.Show("Вы добавили/изменили книгу");
                Manager.GoBack();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }
    }
}
