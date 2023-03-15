using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.EventSystems;

public class ActiveStun : Singleton<ActiveStun>
{
    public Button btnActive;
    public GameObject gameobjAnime;
    public GameObject pickColor;
    private bool stt = false;
    private bool sttPickColor = false;

    [SerializeField]
    GameObject panel;

    [SerializeField]
    FlashImage flashImage;
    AndroidJavaObject _camera = null;
    bool activeCam;
    public AndroidJavaClass javaObject;

    // Start is called before the first frame update
    void Start()
    {
        Debug.Log(GlobalVariables.Get<string>("model"));
    }

    AndroidJavaObject GetUnityActivity()
    {
        using (var unityPlayer = new AndroidJavaClass("com.unity3d.player.UnityPlayer"))
        {
            return unityPlayer.GetStatic<AndroidJavaObject>("currentActivity");
        }
    }

    public void onPickColor()
    {
        if (sttPickColor == false)
        {
            pickColor.SetActive(true);
            sttPickColor = true;
        }
        else if (sttPickColor == true)
        {
            pickColor.SetActive(false);
            sttPickColor = false;
        }
    }

    public void onClickActive()
    {
        if (stt == false)
        {
            panel.GetComponent<Image>().enabled = false;
            gameobjAnime.SetActive(true);
            stt = true;
            AudioManager.Ins.PlaySound(AudioManager.Ins.action);
            flashImage.StartFlashLoop();
        }
        else if (stt == true)
        {
            panel.GetComponent<Image>().enabled = true;
            gameobjAnime.SetActive(false);
            stt = false;
            AudioManager.Ins.PlayThisSound();
            flashImage.StopFlashLoop();
        }
    }

    // Update is called once per frame
    void Update()
    {
        if (stt == true)
        {
            #if !UNITY_EDITOR
                Handheld.Vibrate();
            #endif
        }
    }
}
