<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>PostgreSQL SELECT Example 1</title>
<meta name="description" content="If we want to fetch all rows from the actor table the following PostgreSQL SELECT statement can be used.">
</head>
<body>
<h1>List of all actors in the table</h1>
<?php

$db = pg_connect("host=localhost dbname=jetlinks user=postgres password=jetlinks");
$result = pg_query($db,"SELECT * FROM s_user");
echo "<table>";
while($row=pg_fetch_assoc($result)){echo "<tr>";
echo "<td align='center' width='200'>" . $row['password'] . "</td>";
echo "<td align='center' width='200'>" . $row['salt'] . "</td>";
echo "<td align='center' width='200'>" . $row['create_time'] . "</td>";
echo "<td align='center' width='200'>" . $row['name'] . "</td>";
echo "<td align='center' width='200'>" . $row['creator_id'] . "</td>";
echo "<td align='center' width='200'>" . $row['id'] . "</td>";
echo "<td align='center' width='200'>" . $row['type'] . "</td>";
echo "<td align='center' width='200'>" . $row['username'] . "</td>";
echo "<td align='center' width='200'>" . $row['status'] . "</td>";
echo "</tr>";}echo "</table>";?>
</div>
</body>
</html>
