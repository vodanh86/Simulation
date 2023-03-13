using UnityEngine;

public class AudioManager : Singleton<AudioManager>
{
    [Header("Main Settings:")]
    [Range(0, 1)]
    public float musicVolume;

    [Range(0, 1)]
    public float sfxVolume;
    public AudioSource musicAus;
    public AudioSource AdsJump;
    public AudioSource sfxAus;

    [Header("Game Sounds And Musics:")]
    public AudioClip action;
    public AudioClip win;
    public AudioClip lose;
    public AudioClip select;
    public AudioClip destroy;
    public AudioClip jump;
    public AudioClip monsterWalk;
    public AudioClip[] bgmusics;
    private bool muted = false;
    private bool mutedMS = false;
    public override void Awake()
    {
      //  PlayMusic(bgmusics);
        MakeSingleton(true);
    }



    public override void Start()
    {
        if (!PlayerPrefs.HasKey("mutedMS"))
        {
            PlayerPrefs.SetInt("mutedMS", 0);
            LoadSettingMS();
        }
        else
        {
            LoadSettingMS();
        }
        //2cai
        if (!PlayerPrefs.HasKey("muted"))
        {
            PlayerPrefs.SetInt("muted", 0);
            LoadSetting();
        }
        else
        {
            LoadSetting();
        }
        sfxAus.mute = muted;
        musicAus.mute = mutedMS;
    }
    private void Update()
    {
     
        

    }
    public void PlaySound(AudioClip sound, AudioSource aus = null)
    {
        if (!aus)
        {
            aus = sfxAus;
        }
        if (aus)
        {
           // aus.PlayOneShot(sound, sfxVolume);
            aus.clip = sound;
            aus.loop=true;
            aus.volume =sfxVolume;
            aus.Play();
            // Handheld.Vibrate();
        }
    }
     public void PlayThisSound(AudioSource aus = null)
    {
        if (!aus)
        {
            aus = sfxAus;
        }
        if (aus)
        { aus.loop=false;
           aus.Stop();
            // Handheld.Vibrate();
        }
    }

    public void PlaySound(AudioClip[] sounds, AudioSource aus = null)
    {
        if (!aus)
        {
            aus = sfxAus;
        }
        if (aus)
        {
            int ranIdx = Random.Range(0, sounds.Length);
            if (sounds[ranIdx] != null)
            {
                aus.loop = true;
                aus.PlayOneShot(sounds[ranIdx], sfxVolume);
            }
        }
    }

    public void PlayMusic(AudioClip music, bool loop = true)
    {
        if (musicAus)
        {
            musicAus.clip = music;
            musicAus.loop = loop;
            musicAus.volume = musicVolume;
            musicAus.Play();
        }
    }

    public void PlayMusic(AudioClip[] musics, bool loop = true)
    {
        if (musicAus)
        {
            int ranIdx = Random.Range(0, musics.Length);
            if (musics[ranIdx] != null)
            {
                musicAus.clip = musics[ranIdx];
                musicAus.loop = loop;
                musicAus.volume = musicVolume;
                musicAus.Play();
            }
        }
    }
    public void PlayBG()
    {
        PlayMusic(bgmusics);
    }

    public void StopMusic()
    {
        if (mutedMS == false)
        {
            mutedMS = true;

            musicAus.mute = !musicAus.mute;
        }
        else
        {
            mutedMS = false;
            musicAus.mute = !musicAus.mute;
        }
        saveSettingMS();
    }

    public void StopSound()
    {
        if (muted == false)
        {
            muted = true;
            //   musicAus.volume = 0f;
            sfxAus.mute = !sfxAus.mute;
        }
        else
        {
            muted = false;
            //  musicAus.volume = 100f;
            sfxAus.mute = !sfxAus.mute;
        }
        saveSetting();
    }

    private void LoadSetting()
    {
        muted = PlayerPrefs.GetInt("muted") == 1;
    }

    private void saveSetting()
    {
        PlayerPrefs.SetInt("muted", muted ? 1 : 0);
    }

    ///mute2
    private void LoadSettingMS()
    {
        mutedMS = PlayerPrefs.GetInt("mutedMS") == 1;
    }

    private void saveSettingMS()
    {
        PlayerPrefs.SetInt("mutedMS", mutedMS ? 1 : 0);
    }
}
