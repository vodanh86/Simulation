using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class LoadLevel : MonoBehaviour
{
    public GameObject GameManager;

    public void LoadScene(string modelName)
    {
        GlobalVariables.Set("model", modelName);
        SceneManager.LoadScene("Gun3");
    }

    public void LoadSceneGreen()
    {
        SceneManager.LoadScene("Gun9");
    }

    public void LoadSceneGun2()
    {
        SceneManager.LoadScene("Gun2");
    }

    public void LoadSceneGun3()
    {
        SceneManager.LoadScene("Gun3");
    }

    public void LoadSceneGun1()
    {
        SceneManager.LoadScene("Gun1");
    }

    public void LoadSceneGun5()
    {
        SceneManager.LoadScene("Gun5");
    }

    public void LoadSceneGun8()
    {
        SceneManager.LoadScene("Gun8");
    }

    public void LoadSceneMenu()
    {
        Destroy(GameManager);
        SceneManager.LoadScene("Menu");
    }
}
