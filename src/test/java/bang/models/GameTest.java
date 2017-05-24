package bang.models;

import bang.TableFactory;

import static org.junit.Assert.*;

/**
 * Created by seradam on 2017.05.24..
 */
public class GameTest {

    Game g;
    TableFactory tf;

    @org.junit.Before
    public void setUp() throws Exception {
        g = new Game();
        tf = new TableFactory();
    }

    @org.junit.Test
    public void buildDeck() throws Exception {
        String queryToNumOfCards = "SELECT SUM(initial_amount) FROM card";
        int numberOfCardsBasedOnDB = Integer.parseInt(tf.getData(queryToNumOfCards).get(0).get(0));
        int numberOfCardsBasedOnMethod = g.buildDeck().size();
        assertEquals(numberOfCardsBasedOnDB, numberOfCardsBasedOnMethod);
    }

    @org.junit.Test
    public void getRoles() throws Exception {
        String queryToNumOfRoles = "SELECT SUM(initial_amount) FROM role";
        int numberOfRolesBasedOnDB = Integer.parseInt(tf.getData(queryToNumOfRoles).get(0).get(0));
        int numberOfRolesBasedOnMethod = g.getRoles().size();
        assertEquals(numberOfRolesBasedOnDB, numberOfRolesBasedOnMethod);
    }

    @org.junit.Test
    public void getCharacters() throws Exception {
        String queryToNumOfCharacters = "SELECT COUNT(name) FROM character";
        int numberOfCharactersBasedOnDB = Integer.parseInt(tf.getData(queryToNumOfCharacters).get(0).get(0));
        int numberOfCharactersBasedOnMethod = g.getCharacters().size();
        assertEquals(numberOfCharactersBasedOnDB, numberOfCharactersBasedOnMethod);
    }

}