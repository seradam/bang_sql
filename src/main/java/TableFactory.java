import java.sql.*;

/**
 * Created by seradam on 2017.05.15..
 */
public class TableFactory {

    public void viewTable(String myQuery) throws SQLException {

        Connection conn = getConnection();
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(myQuery);
        ResultSetMetaData rsmd = rs.getMetaData();
        int columnsNumber = rsmd.getColumnCount();
        while (rs.next())
        {
            for (int i = 1; i <= columnsNumber; i++) {
                if (i > 1) System.out.print(",  ");
                String columnValue = rs.getString(i);
                System.out.print(rsmd.getColumnName(i) + ": " + columnValue);
            }
            System.out.println("");
        }
        rs.close();
        st.close();

    }

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(
                "jdbc:postgresql://localhost:5432/bang",
                "postgres",
                "mimikri45");
    }

    public static void main(String[] args) throws SQLException {
        String simpleTestQuery = "SELECT * FROM player";
        String complicatedTestquery = "SELECT player.name, role.name AS role FROM role "+
                "JOIN player ON role.role_id = player.role "+
                "JOIN event ON player.player_id = event.player "+
                "WHERE event.target_player = "+
                "(SELECT player.player_id "+
                "FROM player "+
                "JOIN role ON player.role = role.role_id "+
                "WHERE role.name = 'Sheriff')";
        TableFactory sg = new TableFactory();
        System.out.println("\n Content of player table: \n");
        sg.viewTable(simpleTestQuery);
        System.out.println("\n People who attacked the sheriff: \n");
        sg.viewTable(complicatedTestquery);
    }

}
