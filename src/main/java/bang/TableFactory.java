package bang;

import org.apache.ibatis.jdbc.ScriptRunner;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.Reader;
import java.sql.*;
import java.util.ArrayList;

/**
 * Created by seradam on 2017.05.15..
 */
public class TableFactory {

    public ArrayList<ArrayList<String>> getData(String myQuery) throws SQLException {
        Connection conn = getConnection();
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(myQuery);
        ResultSetMetaData rsmd = rs.getMetaData();
        ArrayList<ArrayList<String>> queryResult = new ArrayList<ArrayList<String>>();
        int columnsNumber = rsmd.getColumnCount();
        while (rs.next()){
            ArrayList<String> inner = new ArrayList<String>();
            queryResult.add(inner);
            for (int i = 1; i <= columnsNumber; i++){
                inner.add(rs.getString(i));
            }
        }
        return queryResult;
    }

    public void setData(String tableName, String coulomnName, String newValue,
                        String identifierCoulomn, String identifierValue) throws SQLException {
        String myQuery = "UPDATE " + tableName + " SET " + coulomnName + " = " + newValue +
                " WHERE " + identifierCoulomn + " = " + identifierValue;
        Connection conn = getConnection();
        PreparedStatement pstmt = conn.prepareStatement(myQuery);
        pstmt.executeUpdate();
    }

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

    public void restartInitialGameState() throws SQLException, FileNotFoundException {
        String filePath = "/home/seradam/bang_sql/src/main/resources/sql/before_game.sql";
        Connection conn = getConnection();
        ScriptRunner runner = new ScriptRunner(conn);
        Reader reader = new BufferedReader(new FileReader(filePath));
        runner.runScript(reader);
    }

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(
                "jdbc:postgresql://localhost:5432/bang",
                "postgres",
                "mimikri45");
    }

    public static void main(String[] args) throws SQLException, FileNotFoundException {
        String simpleTestQuery = "SELECT * FROM player";
        String complicatedTestquery = "SELECT player.name, role.name AS role FROM role "+
                "JOIN player ON role.role_id = player.role "+
                "JOIN event ON player.player_id = event.player "+
                "WHERE event.target_player = "+
                "(SELECT player.player_id "+
                "FROM player "+
                "JOIN role ON player.role = role.role_id "+
                "WHERE role.name = 'Sheriff')";
        String oneLineQuery = "SELECT * FROM player WHERE player_id = 1";
        TableFactory sg = new TableFactory();
//        System.out.println("\n Content of player table: \n");
//        sg.viewTable(simpleTestQuery);
//        System.out.println("\n People who attacked the sheriff: \n");
//        sg.viewTable(complicatedTestquery);
//        System.out.println("\n Nested list version of Content of player table: \n");
//        System.out.println(sg.getData(simpleTestQuery));
//        System.out.println("\n Nested list version of People who attacked the sheriff: \n");
//        System.out.println(sg.getData(complicatedTestquery));
//        System.out.println("\n" + sg.getData(oneLineQuery + "\n"));
        sg.setData("card", "current_amount", "current_amount - 1", "card_id", "1");
        String updateTesterQuery = "SELECT * FROM card WHERE card_id = 1";
        sg.viewTable(updateTesterQuery);
        sg.restartInitialGameState();
        sg.viewTable(updateTesterQuery);
//        sg.setData("character", "choosable", "false", "character_id", "1");
//        String updateTesterQuery2 = "SELECT * FROM character WHERE character_id = 1";
//        sg.viewTable(updateTesterQuery2);

    }

}
