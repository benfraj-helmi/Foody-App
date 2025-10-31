package firsttry;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    // Remplacez les valeurs suivantes par celles appropriées pour votre configuration
    private static final String URL = "jdbc:mysql://localhost:3306/food_delivery?useSSL=false&serverTimezone=UTC"; // URL de connexion
    private static final String USER = "root"; // Utilisateur de la base de données
    private static final String PASSWORD = ""; // Mot de passe de la base de données
   // Classe du driver JDBC

    // Méthode pour obtenir une connexion à la base de données
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        // Charger le pilote de la base de données
    	Class.forName("com.mysql.jdbc.Driver");
        
        // Établir la connexion
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
