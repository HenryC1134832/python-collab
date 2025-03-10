echo 'PESQ calculation for orgin start'
python nnet/compute_pesq.py /media/denoiser/Toshiba-4TB/far_8hr/outputdump/origin/spk1.scp /media/denoiser/Toshiba-4TB/far_8hr/32hr/tt/s1.scp
echo '.......................................'
echo 'PESQ calculation for Hospi_embedding_8hr start'
python nnet/compute_pesq.py /media/denoiser/Toshiba-4TB/far_8hr/outputdump/embedding_8hr/spk1.scp /media/denoiser/Toshiba-4TB/far_8hr/32hr/tt/s1.scp
echo '.......................................'
echo 'PESQ calculation for Hospi_embedding_16hr start'
python nnet/compute_pesq.py /media/denoiser/Toshiba-4TB/far_8hr/outputdump/embedding_16hr/spk1.scp /media/denoiser/Toshiba-4TB/far_8hr/32hr/tt/s1.scp
echo '.......................................'
echo 'PESQ calculation for Hospi_embedding_32hr start'
python nnet/compute_pesq.py /media/denoiser/Toshiba-4TB/far_8hr/outputdump/embedding_32hr/spk1.scp /media/denoiser/Toshiba-4TB/far_8hr/32hr/tt/s1.scp
echo '.......................................'
echo 'PESQ calculation for Hospi_fusion_8hr start'
python nnet/compute_pesq.py /media/denoiser/Toshiba-4TB/far_8hr/outputdump/fusion_8hr/spk1.scp /media/denoiser/Toshiba-4TB/far_8hr/32hr/tt/s1.scp
echo '.......................................'
echo 'PESQ calculation for Hospi_fusion_16hr start'
python nnet/compute_pesq.py /media/denoiser/Toshiba-4TB/far_8hr/outputdump/fusion_16hr/spk1.scp /media/denoiser/Toshiba-4TB/far_8hr/32hr/tt/s1.scp
echo '.......................................'
echo 'PESQ calculation for Hospi_fusion_32hr start'
python nnet/compute_pesq.py /media/denoiser/Toshiba-4TB/far_8hr/outputdump/fusion_32hr/spk1.scp /media/denoiser/Toshiba-4TB/far_8hr/32hr/tt/s1.scp
echo '.......................................'
# echo 'PESQ calculation for add_block_fusion_8hr start'
# python nnet/compute_pesq.py /media/denoiser/Toshiba-4TB/far_8hr/outputdump/add_block_fusion_8hr/spk1.scp /media/denoiser/Toshiba-4TB/far_8hr/32hr/tt/s1.scp
# echo '.......................................'
# echo 'PESQ calculation for repeat_fusion_8hr start'
# python nnet/compute_pesq.py /media/denoiser/Toshiba-4TB/far_8hr/outputdump/add_repeat_fusion_8hr/spk1.scp /media/denoiser/Toshiba-4TB/far_8hr/32hr/tt/s1.scp
# echo '.......................................'
echo 'PESQ calculation for add_block_Nonefusion_8hr start'
python nnet/compute_pesq.py /media/denoiser/Toshiba-4TB/far_8hr/outputdump/add_block_Nonefusion_8hr/spk1.scp /media/denoiser/Toshiba-4TB/far_8hr/32hr/tt/s1.scp
echo '.......................................'
echo 'PESQ calculation for add_block_Nonefusion_16hr start'
python nnet/compute_pesq.py /media/denoiser/Toshiba-4TB/far_8hr/outputdump/add_block_Nonefusion_16hr/spk1.scp /media/denoiser/Toshiba-4TB/far_8hr/32hr/tt/s1.scp
echo '.......................................'
echo 'PESQ calculation for add_block_Nonefusion_32hr start'
python nnet/compute_pesq.py /media/denoiser/Toshiba-4TB/far_8hr/outputdump/add_block_Nonefusion_32hr/spk1.scp /media/denoiser/Toshiba-4TB/far_8hr/32hr/tt/s1.scp
echo '.......................................'
echo 'PESQ calculation for repeat_Nonefusion_8hr start'
python nnet/compute_pesq.py /media/denoiser/Toshiba-4TB/far_8hr/outputdump/repeat_Nonefusion_8hr/spk1.scp /media/denoiser/Toshiba-4TB/far_8hr/32hr/tt/s1.scp
echo '.......................................'
echo 'PESQ calculation for repeat_Nonefusion_16hr start'
python nnet/compute_pesq.py /media/denoiser/Toshiba-4TB/far_8hr/outputdump/repeat_Nonefusion_16hr/spk1.scp /media/denoiser/Toshiba-4TB/far_8hr/32hr/tt/s1.scp
echo '.......................................'
echo 'PESQ calculation for repeat_Nonefusion_32hr start'
python nnet/compute_pesq.py /media/denoiser/Toshiba-4TB/far_8hr/outputdump/repeat_Nonefusion_32hr/spk1.scp /media/denoiser/Toshiba-4TB/far_8hr/32hr/tt/s1.scp
echo '.......................................'
