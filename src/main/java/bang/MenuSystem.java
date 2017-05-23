package bang;

import java.sql.SQLException;
import java.util.Scanner;

/**
 * Created by seradam on 2017.05.21..
 */
public class MenuSystem {

    public static void menu() throws SQLException {
        TableFactory tf = new TableFactory();
        Scanner reader = new Scanner(System.in);
        System.out.println("\nWhat would you like to see?\n\n1. Health of the players \n"
        + "2. Number of player's cards \n3. Items on table \n4. Attacks against the Sheriff");
        String n = reader.next();
        if (n .equals("1")) {
            String query1 = "SELECT name, position, health FROM player";
            System.out.println("\nHealth of the players:\n");
            tf.viewTable(query1);
            MenuSystem.anotherQuestion();
        }
        else if (n .equals("2")) {
            String query2 = "SELECT player.name, player.position, COUNT(playing_field.location) AS number_of_cards " +
                    "FROM playing_field JOIN player ON playing_field.player = player.player_id " +
                    "WHERE playing_field.location = 'hand' " +
                    "GROUP BY player.name, player.position " +
                    "ORDER BY player.position";
            System.out.println("\nNumber of player's cards:\n");
            tf.viewTable(query2);
            MenuSystem.anotherQuestion();
        }
        else if (n .equals("3")) {
            String query3 = "SELECT player.name, player.position, card.name AS item FROM card " +
                    "JOIN playing_field ON card.card_id = playing_field.card " +
                    "JOIN player ON playing_field.player = player.player_id " +
                    "WHERE playing_field.location = 'board' " +
                    "GROUP BY player.name, player.position, card.name " +
                    "ORDER BY player.position";
            System.out.println("\nItems on table:\n");
            tf.viewTable(query3);
            MenuSystem.anotherQuestion();
        }
        else if (n .equals("4")) {
            String query4 = "SELECT player.name, role.name AS role, card.name AS action FROM role " +
                    "JOIN player ON role.role_id = player.role " +
                    "JOIN event ON player.player_id = event.player " +
                    "JOIN card ON event.card = card.card_id WHERE event.target_player = " +
                    "(SELECT player.player_id FROM player " +
                    "JOIN role ON player.role = role.role_id " +
                    "WHERE role.name = 'Sheriff')";
            System.out.println("\nAttacks against the Sheriff:\n");
            tf.viewTable(query4);
            MenuSystem.anotherQuestion();
        }
        else {
            MenuSystem.menu();
        }
    }

    private static void anotherQuestion() throws SQLException {
        Scanner reader2 = new Scanner(System.in);
        System.out.println("\nDo you have another question?\nIf yes, type 'y'");
        String s = reader2.next();
        if (s.equals("y")) {
            MenuSystem.menu();
        }
    }


}
