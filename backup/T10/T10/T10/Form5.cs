using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace T10
{
    public partial class Form5 : Form
    {
        public Form5()
        {
            InitializeComponent();
        }

        private void Form5_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            dataGridView1.ColumnCount = 3;
            dataGridView1.Columns[0].Name = "Product ID";
            dataGridView1.Columns[1].Name = "Name";
            dataGridView1.Columns[2].Name = "Price";
            string[] row = new string[] { "1", "Laptop", "85000" };
            dataGridView1.Rows.Add(row);
            row = new string[] { "2", "Mobile", "30000" };
            dataGridView1.Rows.Add(row);
            row = new string[] { "3", "HeadPhones", "1700" };
            dataGridView1.Rows.Add(row);
        }
    }
}
