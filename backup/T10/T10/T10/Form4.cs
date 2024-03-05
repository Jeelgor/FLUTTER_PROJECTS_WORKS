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
    public partial class Form4 : Form
    {
        public Form4()
        {
            InitializeComponent();
        }

        private void Form4_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            string ConStr = "Data Source=JEEL\\SQLEXPRESS;Initial Catalog=TUTORIAL_10;Integrated Security=True";


            SqlConnection con = new SqlConnection(ConStr);
            // Open the Connection
            con.Open();
            // Sql query and command object
            string query = "select * from Customer";
            SqlDataAdapter adpt = new SqlDataAdapter(query, con);
            DataSet ds = new DataSet();
            adpt.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
        }
    }
}
