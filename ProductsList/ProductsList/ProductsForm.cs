using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Configuration;
using System.Data.SqlClient;

namespace ProductsList
{
    public partial class ProductsForm : Form
    {
        private readonly string _connstring;
        public ProductsForm()
        {
            InitializeComponent();
            _connstring = ConfigurationManager.ConnectionStrings["main"].ConnectionString;
        }

        private void ProductsForm_Load(object sender, EventArgs e)
        {
            FillDataGridView();
            FillCategoriesComboBox();
        }

        private void FillCategoriesComboBox()
        {


            using (var conn = new SqlConnection(_connstring))
            {
                string commandText = "select * from Categories";
                using (var command = new SqlCommand(commandText, conn))
                {
                    conn.Open();

                    using (var reader = command.ExecuteReader())
                    {
                        cmbCategories.Items.Add(new ComboItem
                        {
                            Id = 0,
                            Name = "All"
                        });


                        while (reader.Read())
                        {
                            cmbCategories.Items.Add(new ComboItem
                            {
                                Id = (int)reader[0],
                                Name = (string)reader[1]
                            });
                        }
                    }
                }
            }

        }

        private void cmbCategories_SelectedIndexChanged(object sender, EventArgs e)
        {
            ComboItem selectedCategory = (ComboItem)cmbCategories.SelectedItem;
      
                FillDataGridView(categoryId: selectedCategory.Id, fname: txtProductName.Text.Trim());


        }

        private void FillDataGridView(int? categoryId = 0, string fname = "")
        {

            using (SqlConnection conn = new SqlConnection(_connstring))
            {
                string commandText = "select Products.Id, ProductName, Categories.CategoryName " +
                    "from Products " +
                    "join Categories on Products.CategoryId = Categories.Id ";

                if (categoryId == 0)
                
                    commandText += $" where Categories.Id = Categories.Id";
                else
                    commandText += $" where Categories.Id = {categoryId}";

                commandText += $" and Products.ProductName LIKE '%{fname}%'";

                SqlDataAdapter adapter = new SqlDataAdapter(commandText, conn);

                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);

                dgwProducts.DataSource = dataTable;

                dgwProducts.Columns[0].Visible = false;
            }
        }

        private void txtProductName_TextChanged(object sender, EventArgs e)
        {
            ComboItem selectedCategory = (ComboItem)cmbCategories.SelectedItem;

            FillDataGridView(categoryId: selectedCategory.Id, fname: txtProductName.Text.Trim());
        }
    }
}
