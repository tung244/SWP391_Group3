
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<title>Syndash - Bootstrap4 Admin Template</title>
	<!--favicon-->
	<link rel="icon" href="assets/images/favicon-32x32.png" type="image/png" />
	<!-- Vector CSS -->
	<link href="assets/plugins/vectormap/jquery-jvectormap-2.0.2.css" rel="stylesheet" />
	<!--plugins-->
	<link href="assets/plugins/simplebar/css/simplebar.css" rel="stylesheet" />
	<link href="assets/plugins/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet" />
	<link href="assets/plugins/metismenu/css/metisMenu.min.css" rel="stylesheet" />
	<!-- loader-->
	<link href="assets/css/pace.min.css" rel="stylesheet" />
	<script src="assets/js/pace.min.js"></script>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600&family=Roboto&display=swap" />
	<!-- Icons CSS -->
	<link rel="stylesheet" href="assets/css/icons.css" />
	<!-- App CSS -->
	<link rel="stylesheet" href="assets/css/app.css" />
	<link rel="stylesheet" href="assets/css/dark-sidebar.css" />
	<link rel="stylesheet" href="assets/css/dark-theme.css" />
        <!-- Bootstrap JS -->
        <script src="../assets/js/bootstrap.bundle.min.js"></script>
	
	<!--plugins-->
        <script src="../assets/js/jquery.min.js"></script>
        <script src="../assets/plugins/simplebar/js/simplebar.min.js"></script>
        <script src="../assets/plugins/metismenu/js/metisMenu.min.js"></script>
        <script src="../assets/plugins/perfect-scrollbar/js/perfect-scrollbar.js"></script>
        <script src="../assets/plugins/edittable/bstable.js"></script>
	<script>
		 // Basic example
		 var example1 = new BSTable("table1");
		example1.init();
		 // Example with a add new row button & only some columns editable & removed actions column label
		var example2 = new BSTable("table2", {
			editableColumns: "1,2",
			$addButton: $('#table2-new-row-button'),
			onEdit: function () {
				console.log("EDITED");
			},
			advanced: {
				columnLabel: ''
			}
		});
		example2.init();
		 // Example with dynamic table that requires BSTable refresh
		 // TODO Create method to randomly seed a random amount of rows in the table
		var example3 = new BSTable("table3");
		example3.init();

		function dynamicTableValuesExample() {
			// Generate new values for the table and show how BSTable updates
			let names = ['Matt', 'John', 'Billy', 'Erica', 'Sammy', 'Tom', 'Tate', 'Emily', 'Mike', 'Bob'];
			let numberOfRows = Math.floor(Math.random() * 10);
			document.getElementById("table3-body").innerHTML = ''; // Clear current table
			for (let i = 0; i < numberOfRows; i++) {
				let randomNameIndex = Math.floor(Math.random() * 10);
				let row = document.createElement("tr");
				row.innerHTML = `<th scope="row">` + i + `</th><td>Value</td><td>` + names[randomNameIndex] + `</td><td>@twitter</td>`;
				document.getElementById("table3-body").append(row);
			}
			example3.refresh();
		}
	</script>
	<!-- App JS -->
        <script src="/assets/js/app.js"></script>
    </head>
    <body>
        
    </body>
</html>
