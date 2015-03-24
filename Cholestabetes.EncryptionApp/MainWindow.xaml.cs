using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Cholestabetes.EncryptionApp
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }


        private void btnEncrypt_Click(object sender, RoutedEventArgs e)
        {

            try
            {
                grd.ItemsSource = ListEncryptor.Encrypt(this.txtInput.Text);
            }
            catch (Exception exc)
            {

                MessageBox.Show(exc.ToString());
            }
        }

        private void btnDecrypt_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                grd.ItemsSource = ListEncryptor.Decrypt(this.txtInput.Text);
            }
            catch (Exception exc)
            {
                MessageBox.Show(exc.ToString());
            }

        }
    }
}
