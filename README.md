<h1 align="center">Extract selected b-values from DWI</h1>

<p align="center">
  Extracts the DWI volumes of a chosen b-value shell, with matching bvals and bvecs, using MRtrix3 dwiextract.
</p>

<p align="center">
  <a href="https://github.com/brainlife/abcd-spec"><img src="https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg" alt="ABCD Spec v1.1"></a>
  <a href="https://doi.org/10.25663/brainlife.app.841"><img src="https://img.shields.io/badge/Brainlife-brainlife.app.841-blue.svg" alt="Run on brainlife.io"></a>
</p>

## At a glance

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

> **Extracts the DWI volumes of a chosen b-value shell, with matching bvals and bvecs, using MRtrix3 dwiextract.**

Runs dwiextract -shell on the DWI to keep only the volumes of the target b-value (default 0, the b0 volumes). Use it to get b0 or single-shell images from multi-shell DWI. Warning: separate.sh reads the config key bval while the parameter is target_bval, and main checks dwi/dwi.nii.gz while the script writes nodif/, so the App fails as committed; the README describes the older b0/non-b0 split App.

| | |
|---|---|
| **Inputs** | `neuro/dwi` |
| **Outputs** | `neuro/dwi` |
| **Container** | `brainlife/mrtrix3:3.0.0` |
| **Resources** | 8 CPUs · 20 GB memory · 0.5 h walltime |
| **Run it** | [doi.org/10.25663/brainlife.app.841](https://doi.org/10.25663/brainlife.app.841) |

#### Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `dwi` | `neuro/dwi` | yes | The path to the DWI datatype |

#### Outputs

| Output | Datatype | Description |
|---|---|---|
| `nodif` | `neuro/dwi` | The target DWI volumes |

<details>
<summary><b>Parameters</b> (1)</summary>

| Parameter | Type | Default | Description |
|---|---|---|---|
| `target_bval` | string | `0` | b-value of the shell to extract (0 for b0 volumes); currently not read by separate.sh, which reads the key bval. |

</details>

<!-- brainlife-app:end -->

## Running the App

### On brainlife.io

Open the App at [doi.org/10.25663/brainlife.app.841](https://doi.org/10.25663/brainlife.app.841), choose `neuro/dwi` from your project, set the parameters and press **Execute**. The results are saved to your project as `neuro/dwi`.

### Locally

You need [Singularity/Apptainer](https://apptainer.org/) (the App runs in `brainlife/mrtrix3:3.0.0`), [`jq`](https://jqlang.github.io/jq/).

1. Clone this repository.
2. Create `config.json` with the paths to your inputs and the parameters:

   ```json
   {
       "dwi": "/path/to/dwi/dwi",
       "bvecs": "/path/to/dwi/bvecs",
       "bvals": "/path/to/dwi/bvals",
       "sbref": "/path/to/dwi/sbref",
       "sbref_json": "/path/to/dwi/sbref_json",
       "target_bval": "0"
   }
   ```

3. Run `./main`.

## Troubleshooting

- **failed**: separate.sh writes to nodif/ but main checks dwi/dwi.nii.gz, and the parameter key differs (target_bval vs bval); both must be fixed in the code.

## Citing

If you use this App, please cite it, the software it builds on and brainlife.io:

- Extract selected b-values from DWI. brainlife.io App. [doi:10.25663/brainlife.app.841](https://doi.org/10.25663/brainlife.app.841)
- Tournier J-D, et al. MRtrix3: A fast, flexible and open software framework for medical image processing and visualisation. NeuroImage 202:116137 (2019). [doi:10.1016/j.neuroimage.2019.116137](https://doi.org/10.1016/j.neuroimage.2019.116137)
- Tournier, J.-D.; Smith, R. E.; Raffelt, D.; Tabbara, R.; Dhollander, T.; Pietsch, M.; Christiaens, D.; Jeurissen, B.; Yeh, C.-H. & Connelly, A. MRtrix3: A fast, flexible and open software framework for medical image processing and visualisation. NeuroImage, 2019, 202, 116137
- Hayashi S, Caron BA, Heinsfeld AS, et al. brainlife.io: a decentralized and open-source cloud platform to support neuroscience research. *Nature Methods* 21:809–813 (2024). [doi:10.1038/s41592-024-02237-2](https://doi.org/10.1038/s41592-024-02237-2)
- Avesani P, McPherson B, Hayashi S, et al. The open diffusion data derivatives, brain data upcycling via integrated publishing of derivatives and reproducible open cloud services. *Scientific Data* 6:69 (2019). [doi:10.1038/s41597-019-0073-y](https://doi.org/10.1038/s41597-019-0073-y)

## Authors

- Brad Caron

**Contributors**

- Soichi Hayashi

## Funding

[![Wellcome-226486/Z/22/Z](https://img.shields.io/badge/Wellcome-226486%2FZ%2F22%2FZ-purple.svg)](https://wellcome.org/)
[![NIH-NINDS-U24NS140384](https://img.shields.io/badge/NIH_NINDS-U24NS140384-green.svg)](https://reporter.nih.gov/project-details/11261037)
[![NIH-NINDS-UM1NS132207](https://img.shields.io/badge/NIH_NINDS-UM1NS132207-green.svg)](https://reporter.nih.gov/project-details/11411328)
[![NIH-NIBIB-R01EB029272](https://img.shields.io/badge/NIH_NIBIB-R01EB029272-green.svg)](https://reporter.nih.gov/project-details/10262925)
[![NIH-NIBIB-R01EB030896](https://img.shields.io/badge/NIH_NIBIB-R01EB030896-green.svg)](https://reporter.nih.gov/project-details/10428625)
[![NIH-NIMH-R01MH126699](https://img.shields.io/badge/NIH_NIMH-R01MH126699-green.svg)](https://reporter.nih.gov/project-details/10460628)
[![NIH-NIDCD-R01DC020088](https://img.shields.io/badge/NIH_NIDCD-R01DC020088-green.svg)](https://reporter.nih.gov/project-details/11140284)
[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-2203524](https://img.shields.io/badge/NSF_BCS-2203524-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2203524)
[![NSF-IIS-1636893](https://img.shields.io/badge/NSF_IIS-1636893-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1636893)
[![NSF-OAC-2148729](https://img.shields.io/badge/NSF_OAC-2148729-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148729)
[![NSF-IIS-1912270](https://img.shields.io/badge/NSF_IIS-1912270-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1912270)
[![NSF-IIS-2148700](https://img.shields.io/badge/NSF_IIS-2148700-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148700)
[![NSF-OAC-1916518](https://img.shields.io/badge/NSF_OAC-1916518-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1916518)

<sub>brainlife.io, which runs this App, is publicly funded by Wellcome, the U.S. National Institutes of Health and the U.S. National Science Foundation; acknowledging that support helps keep it running.</sub>
