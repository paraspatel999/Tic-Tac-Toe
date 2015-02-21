package ttt.model.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTransactionalTestNGSpringContextTests;
import org.testng.annotations.Test;

import ttt.model.Games;


import ttt.model.Users;

@Test(groups = "test")
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class UserDaoTest extends AbstractTransactionalTestNGSpringContextTests {

    @Autowired
    UserDao userDao;
    
    
    
    @Test
    public void getUser()
    {
    	
    	
        assert userDao.getUser("cysun").getUsername().equalsIgnoreCase( "cysun" );
    }

   

}
