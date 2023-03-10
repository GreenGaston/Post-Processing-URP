using UnityEngine;

//[System.Serializable, CreateAssetMenu(fileName = "DitheringMaterial", menuName = "DitheringMaterial")]
public class DitheringMaterial : UnityEngine.ScriptableObject
{
    //---Your Materials---
    public Material customEffect;
    
    //---Accessing the data from the Pass---
    static DitheringMaterial _instance;

    public static DitheringMaterial Instance
    {
        get
        {
            if (_instance != null) return _instance;
            // TODO check if application is quitting
            // and avoid loading if that is the case

            //get the material called "DoG" from the resources folder
            Material customEffect = Resources.Load<Material>("Dithering");
          
            //convert the material to a CustomPostProcessingMaterials
            _instance = CreateInstance<DitheringMaterial>();

            //set the material to the instance
            _instance.customEffect = customEffect;

            return _instance;
        }
    }

    public DitheringMaterial(Material customEffect)
    {
        this.customEffect = customEffect;
    }
} 