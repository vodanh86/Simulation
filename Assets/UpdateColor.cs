using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class UpdateColor : MonoBehaviour
{
    public FlexibleColorPicker fcp;
    public Image images1,image2,image3;
    public ParticleSystem pts;
    public ActiveStun activestun;
  
    void Awake()
    {
     
        
    }
    // Update is called once per frame
    void Update()
    {
       
        images1.color = fcp.color;
        image2.color =fcp.color;
        pts.startColor = fcp.color;
      image3.color=fcp.color;
    }
}
