# Filters
- `Q1` generates results of applying *Wiener filter* in both frequency domain and spatial domain for the given image under low light condition and beta value. 
- `Q2Q3` compares *Wiener filter* and *Gaussian filter* for noisy image, calculates the MSE and use MATLAB build-in Bilateral filter to minimize the MSE. 

## Wiener Filter in Spatial and Frequency Domain
When the frequency distribution of the image energy and the noise energy differ, we can improve the signal-to-noise ratio (SNR) by boosting the Fourier amplitudes where the image is strong relative to the noise and attenuating the Fourier amplitudes where it is relatively weak.

#### Why Winer Filter?
- The Wiener filter minimizes the expected mean square error (MSE) of the estimated image relative to the original image before noise was added.
- It is the optimal linear shift-invariant solution to this problem
- Note that this optimality is general - it does not depend upon either the noise or the image being Gaussian.

The Wiener filter is given by
$$H({\omega}_{x},{\omega}_{y})=\frac{ {P}_{g}({\omega}_{x},{\omega}_{y})}{{P}_{f}({\omega}_{x},{\omega}_{y})}=\frac{{P}_{g}({\omega}_{x},{\omega}_{y})}{{P}_{g}({\omega}_{x},{\omega}_{y})+{P}_{n}({\omega}_{x},{\omega}_{y})}$$

- ${{P}_{f}({\omega}_{x},{\omega}_{y})}$ is the power spectral density of the noisy sensed image
- ${{P}_{g}({\omega}_{x},{\omega}_{y})}$ is the power spectral density of the optical image before noise was added
- ${{P}_{n}({\omega}_{x},{\omega}_{y})}$ is the power spectral density of the noise

#### Wiener Filter Example
`freqdomain.m` constructs Wiener filter in frequency domain with Fourier transform through following steps. 
`spacedomain.m` get the inverse Hankel transform of $H(\omega)$ by taking the inverse Fourier transform of $H({\omega}_{x},{\omega}_{y})$

Assume isotropic spectral densities for both image and noise
1. Image spectral density is lowpass, $${P}_{g}({\omega}_{x},{\omega}_{y})=\frac{{\alpha}^{2}}{{\omega}^{2}}$$ where ${\omega}^{2}={\omega}_{x}^{2}+{\omega}_{y}^{2}$
2. Noise spectral density is white $${{P}_{n}({\omega}_{x},{\omega}_{y})}={\sigma}_{n}^{2}$$
3. ${P}_{g}({\omega}_{x},{\omega}_{y})=\frac{{(\alpha/\omega)}^{2}}{{(\alpha/\omega)}^{2}+{({\sigma}_{n})}^{2}}=\frac{1}{1+{(\omega/\beta)}^{2}}$ , where $\beta=\alpha/{\sigma}_{n}$ is the SNR

<img src="pics/imagescspatial.png" alt="space"  width="220" height="180" /> 
<img src="pics/plotspatial.png" alt="plotspace"  width="220" height="180" /> <br/>
<img src="pics/imagescfreq.png" alt="freq"  width="220" height="180" /> 
<img src="pics/plotfreq.png" alt="plotfreq"  width="220" height="180" /> <br/>

<img src="pics/origin.png" alt="origin"  width="170" height="150" />
<img src="pics/space.png" alt="spacepic"  width="170" height="150" /> 
<img src="pics/freq.png" alt="freqpic"  width="170" height="150" /><br/>

## Winer and Gaussian Filter
Create a noisy version of input image, then use *Wiener filter* and *Gaussian filter* for denoising

<img src="pics/origin2.png" alt="origin2"  width="243" height="246" /> 
<img src="pics/noisy.png" alt="noisy"  width="243" height="246" /> <br/>
<img src="pics/wiener.png" alt="wiener"  width="243" height="246" /> 
<img src="pics/gauss.png" alt="gauss"  width="243" height="246" /> <br/>

Plot the MSE(Mean Squared Error) to find the optimal value that minimizes MES

<img src="pics/MSEbeta.png" alt="MSEbeta"  width="240" height="197" /> 
<img src="pics/MSEsigma.png" alt="MSEsigma"  width="240" height="197" /> <br/>

# Bilateral filter
- *Gaussian linear* filters provide a nice way of grading the weights of neighbouring pixels so that closer pixels have more influence than more distant pixels.
- *Median filters* provide a nice way of reducing the influence of outlier values.

*Bilateral filter* is the comibnation of domain kernel(Gaussian) and range kernel(Median). 

![bilateralex](pics/bilateralex.png)

Result of using bilatreal filter: 

<img src="pics/bilateral.png" alt="bilateral"  width="243" height="246" /> <br/>
