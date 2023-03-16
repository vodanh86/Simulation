using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FlashlightPlugin : MonoBehaviour
{
    public AndroidJavaClass javaObject;

    void Start()
    {
        javaObject = new AndroidJavaClass("com.myflashlight.flashlightlib.Flashlight");
    }

    public void TurnOn()
    {
        Debug.Log("On");
        #if !UNITY_EDITOR
            javaObject.CallStatic("on", GetUnityActivity());
        #endif
    }

    public void TurnOff()
    {
        Debug.Log("Off");
        #if !UNITY_EDITOR
            javaObject.CallStatic("off", GetUnityActivity());
        #endif
    }

    AndroidJavaObject GetUnityActivity()
    {
        using (var unityPlayer = new AndroidJavaClass("com.unity3d.player.UnityPlayer"))
        {
            return unityPlayer.GetStatic<AndroidJavaObject>("currentActivity");
        }
    }
}
