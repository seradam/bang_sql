package bang.models;

import bang.TableFactory;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.allOf;
import static org.hamcrest.Matchers.is;

/**
 * Created by seradam on 2017.05.24..
 */

public class GameTest {

    private Game g;
    private TableFactory tf;

    @org.junit.Before
    public void setUp() throws Exception {
        g = new Game();
        tf = new TableFactory();
        tf.restartInitialGameState();
    }

    @org.junit.Test
    public void buildDeckLengthTest() throws Exception {
        String queryToNumOfCards = "SELECT SUM(initial_amount) FROM card";
        int numberOfCardsBasedOnDB = Integer.parseInt(tf.getData(queryToNumOfCards).get(0).get(0));
        int numberOfCardsBasedOnMethod = g.buildDeck().size();
        assertThat(80, allOf(is(numberOfCardsBasedOnDB), is(numberOfCardsBasedOnMethod)));
    }

    @org.junit.Test
    public void buildDeckChooseOneTest() throws Exception {
        String queryToNumOfCards = "SELECT * FROM card";
        String cardNameBasedOnDB = tf.getData(queryToNumOfCards).get(5).get(1);
        String cardNameBasedOnMethod = g.buildDeck().get(46).name;
        assertThat("Wells Fargo", allOf(is(cardNameBasedOnDB), is(cardNameBasedOnMethod)));
    }

    @org.junit.Test
    public void getRolesLengthTest() throws Exception {
        String queryToNumOfRoles = "SELECT SUM(initial_amount) FROM role";
        int numberOfRolesBasedOnDB = Integer.parseInt(tf.getData(queryToNumOfRoles).get(0).get(0));
        int numberOfRolesBasedOnMethod = g.getRoles().size();
        assertThat(7, allOf(is(numberOfRolesBasedOnDB), is(numberOfRolesBasedOnMethod)));
    }

    @org.junit.Test
    public void getRolesChooseOneTest() throws Exception {
        String queryToNumOfCards = "SELECT * FROM role";
        String cardNameBasedOnDB = tf.getData(queryToNumOfCards).get(3).get(1);
        String cardNameBasedOnMethod = g.getRoles().get(6).name;
        assertThat("Renegade", allOf(is(cardNameBasedOnDB), is(cardNameBasedOnMethod)));
    }

    @org.junit.Test
    public void getCharactersLengthTest() throws Exception {
        String queryToNumOfCharacters = "SELECT COUNT(name) FROM character";
        int numberOfCharactersBasedOnDB = Integer.parseInt(tf.getData(queryToNumOfCharacters).get(0).get(0));
        int numberOfCharactersBasedOnMethod = g.getCharacters().size();
        assertThat(16, allOf(is(numberOfCharactersBasedOnDB), is(numberOfCharactersBasedOnMethod)));
    }

    @org.junit.Test
    public void getCharactersChooseOneTest() throws Exception {
        String queryToNumOfCards = "SELECT * FROM character";
        String cardNameBasedOnDB = tf.getData(queryToNumOfCards).get(14).get(1);
        String cardNameBasedOnMethod = g.getCharacters().get(14).name;
        assertThat("Vulture Sam", allOf(is(cardNameBasedOnDB), is(cardNameBasedOnMethod)));
    }

    @org.junit.Test
    public void createOnePlayerRoleListLengthTest() throws Exception {
        Player player1 = g.createOnePlayer("Aladár", 1);
        Player player2 = g.createOnePlayer("Béla", 2);
        Player player3 = g.createOnePlayer("Cecil", 3);
        Player player4 = g.createOnePlayer("Dénes", 4);
        Player player5 = g.createOnePlayer("Elemér", 5);
        Player player6 = g.createOnePlayer("Ferenc", 6);
        Player player7 = g.createOnePlayer("Géza", 7);
        String queryToNumOfRoles = "SELECT SUM(current_amount) FROM role";
        int numberOfRolesBasedOnDB = Integer.parseInt(tf.getData(queryToNumOfRoles).get(0).get(0));
        int numberOfRolesBasedOnMethod = g.listOfRoles.size();
        assertThat(0, allOf(is(numberOfRolesBasedOnDB), is(numberOfRolesBasedOnMethod)));
    }

    @org.junit.Test
    public void createOnePlayerCharacterListLengthTest() throws Exception {
        Player player1 = g.createOnePlayer("Aladár", 1);
        Player player2 = g.createOnePlayer("Béla", 2);
        Player player3 = g.createOnePlayer("Cecil", 3);
        Player player4 = g.createOnePlayer("Dénes", 4);
        Player player5 = g.createOnePlayer("Elemér", 5);
        Player player6 = g.createOnePlayer("Ferenc", 6);
        Player player7 = g.createOnePlayer("Géza", 7);
        String queryToNumOfRoles = "SELECT COUNT(choosable) FROM character WHERE choosable = true";
        int numberOfRolesBasedOnDB = Integer.parseInt(tf.getData(queryToNumOfRoles).get(0).get(0));
        int numberOfRolesBasedOnMethod = g.listofCharacters.size();
        assertThat(9, allOf(is(numberOfRolesBasedOnDB), is(numberOfRolesBasedOnMethod)));
    }
}