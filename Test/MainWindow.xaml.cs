using System;
using System.Windows;
using Test.Models;
using Test.Views.Page;

namespace Test
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            Manager.MainFrame = MainFrame;
            Manager.Navigate(new AuthPage());
        }

        private void BtnBack_Click(object sender, RoutedEventArgs e)
        {
            Manager.GoBack();
        }

        private void MainFrame_ContentRendered(object sender, EventArgs e)
        {

        }
    }
}
