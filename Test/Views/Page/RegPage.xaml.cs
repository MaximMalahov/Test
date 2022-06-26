using System.Linq;
using System.Windows;
using Test.Models;
using Test.Models.Entity;

namespace Test.Views.Page
{
    /// <summary>
    /// Логика взаимодействия для RegPage.xaml
    /// </summary>
    public partial class RegPage 
    {
        public RegPage()
        {
            InitializeComponent();
        }

        private void BtnReg_Click(object sender, RoutedEventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(Login.Text) && !TestEntities.GetContext().Users.Where(x => x.Login == Login.Text).Any())
            {
                User user = new User();
                user.Login = Login.Text;
                user.Password = Password.Password;
                TestEntities.GetContext().Users.Add(user);
                TestEntities.GetContext().SaveChanges();
                MessageBox.Show("Вы успешно зарегестрировались!");
                Manager.GoBack();
            }
            else
            {
                MessageBox.Show("Такой пользователь уже существует!");
            }
        }
    }
}
