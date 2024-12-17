case 'delete_product_fl':
            {
                $dmsp = getall_catalog();
                $dmee = getall_user();
                $dmsup = getall_supplier();
                include ("product.php");
                echo '<script>
                    alert("Cancelled!");
                </script>';
                break;
            }
case 'delete_product_sc':
{
    if(isset($_GET['id']) && ($_GET['id'] != ""))
    {
        $id = $_GET['id'];
        delete_product($id);
        $dmsp = getall_catalog();
        $dmee = getall_user();
        $dmsup = getall_supplier();
        include ("product.php");
        echo '<script>
            alert("Item deleted!");
        </script>';
    }
    else{
        $dmsp = getall_catalog();
        $dmee = getall_user();
        $dmsup = getall_supplier();
        include ("product.php");
        echo '<script>
            alert("Fail to delete item!");
        </script>';
    }
    break;
}