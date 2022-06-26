using System.Linq;
using System.Windows;
using Test.Models.Entity;

namespace Test.Views.Page
{
    /// <summary>
    /// Логика взаимодействия для AuthorPage.xaml
    /// </summary>
    public partial class AuthorPage 
    {
        public AuthorPage()
        {
            InitializeComponent();
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            DGridAuthor.ItemsSource = TestEntities.GetContext().Authors.ToList();
        }
    }
}
