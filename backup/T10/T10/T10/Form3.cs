using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace T10
{
    public partial class Form3 : Form
    {
        public Form3()
        {
            InitializeComponent();
        }

        private void Form3_Load(object sender, EventArgs e)
        {
            comboBox1.Items.Add("1");
            comboBox1.Items.Add("2");
            comboBox1.Items.Add("3");
            comboBox1.Items.Add("4");
            comboBox1.Items.Add("5");
            comboBox1.Items.Add("6");
            comboBox1.Items.Add("7");
            comboBox1.Items.Add("8");
            comboBox1.Items.Add("9");
            comboBox1.Items.Add("10");

        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(comboBox1.SelectedItem) == 1)
            {
                string ConStr = "Data Source=JEEL\\SQLEXPRESS;Initial Catalog=TUTORIAL_10;Integrated Security=True";
                                 
                SqlConnection con = new SqlConnection(ConStr);
                con.Open();
                string query = "Select o.OrderID, Name, City, " + "State, o.OrderAmount " + "From customer , Orders o " + "WHERE Name=Name";
                SqlDataAdapter adp = new SqlDataAdapter(query, con);
                DataSet ds = new DataSet();
                adp.Fill(ds);
                dataGridView1.DataSource = ds.Tables[0];
            }
            else if (Convert.ToInt32(comboBox1.SelectedItem) == 2)
            {
                string ConStr = "Data Source=JEEL\\SQLEXPRESS;Initial Catalog=TUTORIAL_10;Integrated Security=True";
                SqlConnection con = new SqlConnection(ConStr);
                con.Open();
                string query = "Select o.OrderID , Name, City, " + "State, o.OrderAmount " + "From customer , Orders o " + "WHERE Name=Name AND OrderAmount > 10000";
                SqlDataAdapter adp = new SqlDataAdapter(query, con);
                DataSet ds = new DataSet();
                adp.Fill(ds);
                dataGridView1.DataSource = ds.Tables[0];
            }
            else if (Convert.ToInt32(comboBox1.SelectedItem) == 3)
            {
                string ConStr = "Data Source=JEEL\\SQLEXPRESS;Initial Catalog=TUTORIAL_10;Integrated Security=True";
                SqlConnection con = new SqlConnection(ConStr);
                con.Open();
                // Sql query and command object
                string query = "select Name, Address, City, State, Email, ContactNo, Profession , o.OrderAmount FROM customer , Orders o WHERE Name=Name";

                SqlDataAdapter adp = new SqlDataAdapter(query, con);
                DataSet ds = new DataSet();
                adp.Fill(ds);
                dataGridView1.DataSource = ds.Tables[0];
            }
            else if (Convert.ToInt32(comboBox1.SelectedItem) == 4)
            {
                string ConStr = "Data Source=JEEL\\SQLEXPRESS;Initial Catalog=TUTORIAL_10;Integrated Security=True";
                SqlConnection con = new SqlConnection(ConStr);
                con.Open();
                // Sql query and command object
                string query = "select  Name, o.OrderDate, o.OrderAmount FROM customer , Orders o WHERE Name = Name order by o.OrderDate ";

                SqlDataAdapter adp = new SqlDataAdapter(query, con);
                DataSet ds = new DataSet();
                adp.Fill(ds);
                dataGridView1.DataSource = ds.Tables[0];
            }
            else if (Convert.ToInt32(comboBox1.SelectedItem) == 5)
            {
                string ConStr = "Data Source=JEEL\\SQLEXPRESS;Initial Catalog=TUTORIAL_10;Integrated Security=True";
                SqlConnection con = new SqlConnection(ConStr);
                con.Open();
                // Sql query and command object
                string query = "select PaymentMode, SUM(OrderAmount) From Orders Group by PaymentMode";

                SqlDataAdapter adp = new SqlDataAdapter(query, con);
                DataSet ds = new DataSet();
                adp.Fill(ds);
                dataGridView1.DataSource = ds.Tables[0];
            }
            else if (Convert.ToInt32(comboBox1.SelectedItem) == 6)
            {
                string ConStr = "Data Source=JEEL\\SQLEXPRESS;Initial Catalog=TUTORIAL_10;Integrated Security=True";
                SqlConnection con = new SqlConnection(ConStr);
                con.Open();
                // Sql query and command object
                string query = "select PaymentMode, sum(OrderAmount) as Total From Orders where year(OrderDate) = '2023' Group by PaymentMode";

                SqlDataAdapter adp = new SqlDataAdapter(query, con);
                DataSet ds = new DataSet();
                adp.Fill(ds);
                dataGridView1.DataSource = ds.Tables[0];
            }
            else if (Convert.ToInt32(comboBox1.SelectedItem) == 7)
            {
                string ConStr = "Data Source=JEEL\\SQLEXPRESS;Initial Catalog=TUTORIAL_10;Integrated Security=True";
                SqlConnection con = new SqlConnection(ConStr);
                con.Open();
                // Sql query and command object
                string query = "select PaymentMode, sum(OrderAmount) as Total From Orders where year(OrderDate) = '2022' Group by PaymentMode";

                SqlDataAdapter adp = new SqlDataAdapter(query, con);
                DataSet ds = new DataSet();
                adp.Fill(ds);
                dataGridView1.DataSource = ds.Tables[0];
            }
            else if (Convert.ToInt32(comboBox1.SelectedItem) == 8)
            {
                string ConStr = "Data Source=JEEL\\SQLEXPRESS;Initial Catalog=TUTORIAL_10;Integrated Security=True";

                SqlConnection con = new SqlConnection(ConStr);
                con.Open();
                // Sql query and command object
                string query = "select PaymentMode, SUM(OrderAmount) From Orders Group by PaymentMode";

                SqlDataAdapter adp = new SqlDataAdapter(query, con);
                DataSet ds = new DataSet();
                adp.Fill(ds);
                dataGridView1.DataSource = ds.Tables[0];
            }
            else if (Convert.ToInt32(comboBox1.SelectedItem) == 9)
            {
                string ConStr = "Data Source=JEEL\\SQLEXPRESS;Initial Catalog=TUTORIAL_10;Integrated Security=True";

                SqlConnection con = new SqlConnection(ConStr);
                con.Open();
                // Sql query and command object
                string query = "select * from customer where City='Rajkot'";


                SqlDataAdapter adp = new SqlDataAdapter(query, con);
                DataSet ds = new DataSet();
                adp.Fill(ds);
                dataGridView1.DataSource = ds.Tables[0];
            }
            else if (Convert.ToInt32(comboBox1.SelectedItem) == 10)
            {
                string ConStr = "Data Source=JEEL\\SQLEXPRESS;Initial Catalog=TUTORIAL_10;Integrated Security=True";

                SqlConnection con = new SqlConnection(ConStr);
                con.Open();
                // Sql query and command object
                string query = "SELECT Name, Email, o.OrderAmount FROM customer c INNER JOIN Orders o ON Name = Name WHERE o.OrderAmount > 5000";

                SqlDataAdapter adp = new SqlDataAdapter(query, con);
                DataSet ds = new DataSet();
                adp.Fill(ds);
                dataGridView1.DataSource = ds.Tables[0];

            }
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            for (int i = 0; i < 11; i++)
            {
                comboBox1.Items.Add(i);
            }
        }
    }
}
