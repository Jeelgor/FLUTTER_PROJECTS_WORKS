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
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace T10
{
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }

        private void clearAll()
        {
            textBox1.Text = "";
            textBox2.Text = "";
            textBox3.Text = "";
            textBox4.Text = "";
            textBox5.Text = "";
            textBox6.Text = "";

        }
        private void button2_Click(object sender, EventArgs e)
        {
            clearAll();

        }

        private void button3_Click(object sender, EventArgs e)
        {
            string ConStr = "Data Source=JEEL\\SQLEXPRESS;Initial Catalog=TUTORIAL_10;Integrated Security=True";
            SqlConnection con = new SqlConnection(ConStr);
            // Open the Connection
            con.Open();

            // Sql query and command object
            string query = "INSERT INTO customer(Name,Address,City,State,Email,ContactNo,Profession)" + "VALUES(@Name ,@Address ,@City , @State , @Email , @Contact , @Profession)";
            SqlCommand command = new SqlCommand(query, con);
            // Set the parameters value
            command.Parameters.AddWithValue("@Name", textBox1.Text);
            // command.Parameters.AddWithValue("@CustName", cmbCustName.Text);
            command.Parameters.AddWithValue("@Address", textBox2.Text);
            command.Parameters.AddWithValue("@City", textBox3.Text);
            command.Parameters.AddWithValue("@State", textBox4.Text);
            command.Parameters.AddWithValue("@Email", textBox5.Text);
            command.Parameters.AddWithValue("@Contact", textBox6.Text);
            command.Parameters.AddWithValue("@Profession", textBox7.Text);
            //command.Parameters.AddWithValue("@Id", ab);
            // Execute query
            command.ExecuteNonQuery();
            // Connection close
            MessageBox.Show("Record Insert successfully.");
            con.Close();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            clearAll();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            string ConStr = "Data Source=JEEL\\SQLEXPRESS;Initial Catalog=TUTORIAL_10;Integrated Security=True";
            SqlConnection con = new SqlConnection(ConStr);
            // Open the Connection
            con.Open();


            // Sql query and command object
            string query = "update customer set Name=@Name , Address = @Address , City = @City , State = @State , Email = @Email, ContactNo = @Contact, Profession = @Profession where Name = @Name";
            SqlCommand command = new SqlCommand(query, con);
            // Set the parameters value
            //command.Parameters.AddWithValue("@CustID", textBox2.Text);//
            command.Parameters.AddWithValue("@Name", textBox1.Text);
            command.Parameters.AddWithValue("@Address", textBox2.Text);
            command.Parameters.AddWithValue("@City", textBox3.Text);
            command.Parameters.AddWithValue("@State", textBox4.Text);
            command.Parameters.AddWithValue("@Email", textBox5.Text);
            command.Parameters.AddWithValue("@Contact", textBox6.Text);
            command.Parameters.AddWithValue("@Profession", textBox7.Text);
            //command.Parameters.AddWithValue("@Id", ab);
            // Execute query
            command.ExecuteNonQuery();
            // Connection close
            con.Close();
            clearAll();
            MessageBox.Show("Record updated successfully.");
        }

        private void button7_Click(object sender, EventArgs e)
        {
            //Step : 1 : Connection String and Connection object
            string ConStr = "Data Source=JEEL\\SQLEXPRESS;Initial Catalog=TUTORIAL_10;Integrated Security=True";
            SqlConnection con = new SqlConnection(ConStr);

            //Step : 2 : Open the connection
            con.Open();

            //Step : 3 : Sql query and command object
            string query = "DELETE From customer WHERE Name=@Name";
            SqlCommand cmd = new SqlCommand(query, con);

            //Step : 4 : Set the parameters value
            cmd.Parameters.AddWithValue("@Name", textBox1.Text);

            //Step : 5 : Execute Query
            cmd.ExecuteNonQuery(); //Insert or Update or Delete

            //Step : 6 : Close the connection
            con.Close();

        }

        private void button1_Click(object sender, EventArgs e)
        {
            string ConStr = "Data Source=JEEL\\SQLEXPRESS;Initial Catalog=TUTORIAL_10;Integrated Security=True";
            SqlConnection con = new SqlConnection(ConStr);
            // Open the Connection
            con.Open();
            //SqlDataAdapter adpt = new SqlDataAdapter("select o.OrderID, o.CustID, c.Name, c.Address , c.City, c.State , c.Email , c.ContactNo , c.Profession , o.OrderDate , o.ShipDate , o.OrderAmount , o.PaymentMode , o.Remarks FROM Customer c, Orders o WHERE c.CustID = o.CustID", con);
            SqlDataAdapter adpt = new SqlDataAdapter("select Name , Address,City, State, Email, ContactNo, Profession FROM customer WHERE Name =Name", con);
            //Option - 1
            DataSet ds = new DataSet();
            adpt.Fill(ds);
            DataView dv = ds.Tables[0].DefaultView;
            dataGridView1.DataSource = dv;
        }
    }
}
