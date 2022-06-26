using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using Test.Models;
using Test.Models.Entity;
using Test.Views.Page.EditPage;

namespace Test.Views.Page
{
    /// <summary>
    /// Логика взаимодействия для BookPage.xaml
    /// </summary>
    public partial class BookPage 
    {
        public BookPage()
        {
            InitializeComponent();
        }

        private void BtnEdit_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new BookEditPage((sender as Button)?.DataContext as Book));
        }

        private void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new BookEditPage());
        }

        private void BtnDelete_Click(object sender, RoutedEventArgs e)
        {
            var orderForRemoving = DGridBook.SelectedItems.Cast<Book>().ToList();
            if (MessageBox.Show($"Вы точно хотите удалить следующие { orderForRemoving.Count()} элементов ? ", "Внимание", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    TestEntities.GetContext().Books.RemoveRange(orderForRemoving);
                    TestEntities.GetContext().SaveChanges();
                    MessageBox.Show("Данные удалены!");
                    DGridBook.ItemsSource = TestEntities.GetContext().Books.ToList();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString() + ex.StackTrace.ToString());
                }
            }
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            DGridBook.ItemsSource = TestEntities.GetContext().Books.ToList();
        }
    }
}
