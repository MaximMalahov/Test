using System.Linq;
using System.Windows;
using Test.Models.Entity;

namespace Test.Views.Page
{
    /// <summary>
    /// Логика взаимодействия для GenrePage.xaml
    /// </summary>
    public partial class GenrePage 
    {
        public GenrePage()
        {
            InitializeComponent();
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            DGridGenre.ItemsSource = TestEntities.GetContext().Genres.ToList();
        }
    }
}
