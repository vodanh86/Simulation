using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Energy : MonoBehaviour
{
    [SerializeField] Slider energyBar;
    public int maxEnergy = 25;
    public int currentEnergy;
    public int restoreDuration = 5;
    private DateTime nextEnergyTime;
    private DateTime lastEnergyTime;
    private bool isRestoring = false;

    // Start is called before the first frame update
    void Start()
    {

    }
    private DateTime addDuration(DateTime dateTime,int duration){
        return dateTime.AddSeconds(duration);
    }
    private void UpdateEnergy(){
       energyBar.maxValue = maxEnergy;
       energyBar.value = currentEnergy;
    }
    private DateTime StringToDate(string datetime){
        if(String.IsNullOrEmpty(datetime))
        {
            return DateTime.Now;
        }
        else{
            return DateTime.Parse(datetime);
        }
    }

    private void load()
    {
        currentEnergy = PlayerPrefs.GetInt("currentEnergy");
        nextEnergyTime = StringToDate(PlayerPrefs.GetString("nextEnergyTime"));
        lastEnergyTime = StringToDate(PlayerPrefs.GetString("lastEnergyTime"));


    }
    private void Save()
    {
        PlayerPrefs.SetInt("currentEnergy", currentEnergy);
        PlayerPrefs.SetString("nextEnergyTime", nextEnergyTime.ToString());
        PlayerPrefs.SetString("lastEnergyTime", lastEnergyTime.ToString());
    }
}
