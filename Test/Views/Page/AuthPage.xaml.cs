using System.Linq;
using System.Windows;
using Test.Models;
using Test.Models.Entity;

namespace Test.Views.Page
{
    /// <summary>
    /// Логика взаимодействия для AuthPage.xaml
    /// </summary>
    public partial class AuthPage 
    {
        public AuthPage()
        {
            InitializeComponent();
        }

        private void BtnAuth_Click(object sender, RoutedEventArgs e)
        {

            if (!string.IsNullOrWhiteSpace(Login.Text) && TestEntities.GetContext().Users.Any(x => x.Login == Login.Text))
            {
                if (TestEntities.GetContext().Users.Any(x => x.Login == Login.Text && x.Password == Password.Password))
                {
                    var user = TestEntities.GetContext().Users.First(x => x.Login == Login.Text && x.Password == Password.Password);                   
                    Manager.MainFrame.Navigate(new MenuPage());
                }
                else
                    MessageBox.Show("Пароль не верный!");
            }
            else
                MessageBox.Show("Такого пользователя не существует!");
        }

        private void BtnReg_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new RegPage());
        }
    }
}
