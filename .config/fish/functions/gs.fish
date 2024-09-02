function gs --wraps='DXVK_HDR=1 ENABLE_HDR_WSI=1 gamescope -W 3440 -H 1440 -f -r 144 --hdr-enabled -- %command%' --description 'alias gs DXVK_HDR=1 ENABLE_HDR_WSI=1 gamescope -W 3440 -H 1440 -f -r 144 --hdr-enabled -- %command%'
  DXVK_HDR=1 ENABLE_HDR_WSI=1 gamescope -W 3440 -H 1440 -f -r 144 --hdr-enabled -- $argv
        
end
