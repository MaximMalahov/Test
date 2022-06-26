using System.Windows;
using Test.Models;

namespace Test.Views.Page
{
    /// <summary>
    /// Логика взаимодействия для MenuPage.xaml
    /// </summary>
    public partial class MenuPage 
    {
        public MenuPage()
        {
            InitializeComponent();
        }

        private void BtnGenre_Click(object sender, RoutedEventArgs e) => Manager.MainFrame.Navigate(new GenrePage());


        private void BtnBook_Click(object sender, RoutedEventArgs e) => Manager.MainFrame.Navigate(new BookPage());

        private void BtnAuthor_Click(object sender, RoutedEventArgs e) => Manager.MainFrame.Navigate(new AuthorPage());

    }
}
