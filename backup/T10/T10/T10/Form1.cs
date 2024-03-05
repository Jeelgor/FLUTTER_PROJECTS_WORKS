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
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void clearAll()
        {
            textBox4.Text = "";
            comboBox1.Text = "";
            comboBox2.Text = "";
            dateTimePicker1.Text = "";
            dateTimePicker2.Text = "";
            textBox3.Text = "";
            comboBox3.Text = "";
            textBox5.Text = "";
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            string ConStr = "Data Source=JEEL\\SQLEXPRESS;Initial Catalog=TUTORIAL_10;Integrated Security=True";
            SqlConnection con = new SqlConnection(ConStr);
            // Open the Connection
            con.Open();
            //SqlDataAdapter adpt = new SqlDataAdapter("select o.OrderID, o.CustID, c.Name, c.Address , c.City, c.State , c.Email , c.ContactNo , c.Profession , o.OrderDate , o.ShipDate , o.OrderAmount , o.PaymentMode , o.Remarks FROM Customer c, Orders o WHERE c.CustID = o.CustID", con);
            SqlDataAdapter adpt = new SqlDataAdapter("select o.OrderID , o.CustID,o.OrderDate, o.ShipDate, o.OrderAmount, o.PaymentMode, o.Remarks FROM Orders c, Orders o WHERE c.CustID = o.CustID", con);
            //Option - 1
            DataSet ds = new DataSet();
            adpt.Fill(ds);
            DataView dv = ds.Tables[0].DefaultView;
            dataGridView1.DataSource = dv;
        }

        private void button2_Click(object sender, EventArgs e)
        {
           clearAll();
        }

        private void button4_Click(object sender, EventArgs e)
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
            string query = "INSERT INTO Orders(OrderDate, CustID, ShipDate, OrderAmount, PaymentMode, Remarks, OrderID)" +
               "VALUES(@ODate, @CId, @SDate, @OAMount, @PMode, @Remark, @OId)";

            SqlCommand command = new SqlCommand(query, con);
            // Set the parameters value
            command.Parameters.AddWithValue("@CId", comboBox1.Text);
            command.Parameters.AddWithValue("@OId", textBox4.Text);
            command.Parameters.AddWithValue("@ODate", Convert.ToDateTime(dateTimePicker1.Value));
            command.Parameters.AddWithValue("@SDate", Convert.ToDateTime(dateTimePicker2.Value));
            command.Parameters.AddWithValue("@OAMount", textBox3.Text);
            command.Parameters.AddWithValue("@PMode", comboBox3.Text);
            command.Parameters.AddWithValue("@Remark", textBox5.Text);
            // Execute query
            command.ExecuteNonQuery();
            // Connection close
            con.Close();

        }

        private void button5_Click(object sender, EventArgs e)
        {
            textBox4.Enabled = true;
            button8.Enabled = true;
            int i;
            i = dataGridView1.SelectedCells[0].RowIndex;
            //txtOrderId.Text = dgv.Rows[i].Cells[1].Value.ToString();
            textBox4.Text = dataGridView1.Rows[i].Cells[0].Value.ToString();
            comboBox1.Text = dataGridView1.Rows[i].Cells[1].Value.ToString();
            comboBox2.Text = dataGridView1.Rows[i].Cells[2].Value.ToString();
            dateTimePicker1.Value = Convert.ToDateTime(dataGridView1.Rows[i].Cells[3].Value);
            dateTimePicker2.Value= Convert.ToDateTime(dataGridView1.Rows[i].Cells[4].Value);
            textBox3.Text = dataGridView1.Rows[i].Cells[5].Value.ToString();
            comboBox3.Text = dataGridView1.Rows[i].Cells[6].Value.ToString();
            textBox5.Text = dataGridView1.Rows[i].Cells[7].Value.ToString();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            string ConStr = "Data Source=JEEL\\SQLEXPRESS;Initial Catalog=TUTORIAL_10;Integrated Security=True";
            SqlConnection con = new SqlConnection(ConStr);
            // Open the Connection
            con.Open();

            // Sql query and command object
            string query = "update Orders set OrderDate=@ODate , ShipDate=@SDate , OrderAmount = @OAMount , PaymentMode = @PMode , Remarks = @Remark where OrderID = @OId";
            SqlCommand command = new SqlCommand(query, con);
            // Set the parameters value
            command.Parameters.AddWithValue("@OId", textBox4.Text);
            command.Parameters.AddWithValue("@ODate", dateTimePicker1.Text);
            command.Parameters.AddWithValue("@SDate", dateTimePicker2.Text);
            command.Parameters.AddWithValue("@OAMount", textBox3.Text);
            command.Parameters.AddWithValue("@PMode", comboBox3.Text);
            command.Parameters.AddWithValue("@Remark", textBox5.Text);
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
            string query = "DELETE From customer WHERE CustID=@CustID";
            SqlCommand cmd = new SqlCommand(query, con);
                
            //Step : 4 : Set the parameters value
            cmd.Parameters.AddWithValue("@CustID", comboBox1.Text);

            //Step : 5 : Execute Query
            cmd.ExecuteNonQuery(); //Insert or Update or Delete

            //Step : 6 : Close the connection
            con.Close();

        }

        private void button8_Click(object sender, EventArgs e)
        {
            string ConStr = "Data Source=JEEL\\SQLEXPRESS;Initial Catalog=TUTORIAL_10;Integrated Security=True";
            SqlConnection con = new SqlConnection(ConStr);
            // Open the Connection
            con.Open();

            // Sql query and command object
            string query = "select o.OrderID , o.CustID, o.OrderDate , o.ShipDate , o.OrderAmount , o.PaymentMode , o.Remarks from Customer c, Orders o where OrderId = @id";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@id", textBox4.Text);
            SqlDataReader dr = command.ExecuteReader();

            if (dr.Read())
            {
                textBox4.Text = dr["OrderID"].ToString();
                comboBox1.Text = dr["CustID"].ToString();
                comboBox2.Text = dr["CustomerName"].ToString();
                dateTimePicker1.Text = dr["OrderDate"].ToString();
                dateTimePicker2.Text = dr["ShipDate"].ToString();
                textBox3.Text = dr["OrderAmount"].ToString();
                comboBox3.Text = dr["PaymentMode"].ToString();
                textBox5.Text = dr["Remarks"].ToString();
            }
        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
