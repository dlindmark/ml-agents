
using UnityEngine;

[RequireComponent (typeof(Camera))]
public class ChooseReplacementShader : MonoBehaviour
{
    public Shader m_Shader;
    // Start is called before the first frame update
    void Start()
    {
        Camera camera = GetComponent<Camera>();
        camera.RemoveAllCommandBuffers();
        camera.SetReplacementShader(m_Shader, "");
        camera.backgroundColor = Color.black;
        camera.clearFlags = CameraClearFlags.SolidColor;
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
