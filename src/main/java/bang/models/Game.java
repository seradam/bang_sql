package bang.models;

import java.sql.SQLException;
import java.util.ArrayList;
import bang.TableFactory;

/**
 * Created by seradam on 2017.05.22..
 */
public class Game {

    ArrayList<Role> listOfRoles;
    ArrayList<Character> listofCharacters;
    ArrayList<Card> deck;

    public Game() throws SQLException {
        this.listOfRoles = getRoles();
        this.listofCharacters = getCharacters();
        this.deck = buildDeck();
    }

    public ArrayList<Card> buildDeck() throws SQLException {
        TableFactory tf = new TableFactory();
        String deckGetterQuery = "SELECT * FROM card";
        ArrayList<ArrayList<String>> cardsNestedList = tf.getData(deckGetterQuery);
        ArrayList<Card> deck = new ArrayList<Card>();
        for (int i = 0; i<cardsNestedList.size(); i++){
            int quantityCounter = Integer.parseInt(cardsNestedList.get(i).get(4));
            while (quantityCounter > 0){
                deck.add(new Card(cardsNestedList.get(i).get(1),
                        cardsNestedList.get(i).get(2), cardsNestedList.get(i).get(3)));
                quantityCounter--;
            }
        }
        return deck;
    }

    public ArrayList<Role> getRoles() throws SQLException {
        TableFactory tf = new TableFactory();
        String roleGetterQuery = "SELECT * FROM role";
        ArrayList<ArrayList<String>> roleNestedList = tf.getData(roleGetterQuery);
        ArrayList<Role> roles = new ArrayList<Role>();
        for (int i = 0; i<roleNestedList.size(); i++){
            int quantityCounter = Integer.parseInt(roleNestedList.get(i).get(3));
            while (quantityCounter > 0){
                roles.add(new Role(roleNestedList.get(i).get(1), roleNestedList.get(i).get(2)));
                quantityCounter--;
            }
        }
        return roles;
    }

    public ArrayList<Character> getCharacters() throws SQLException {
        TableFactory tf = new TableFactory();
        String characterGetterQuery = "SELECT * FROM character";
        ArrayList<ArrayList<String>> characterNestedList = tf.getData(characterGetterQuery);
        ArrayList<Character> characters = new ArrayList<Character>();
        for (int i = 0; i<characterNestedList.size(); i++){
            characters.add(new Character(characterNestedList.get(i).get(1), characterNestedList.get(i).get(2),
                    characterNestedList.get(i).get(3)));
        }
        return characters;
    }
}
