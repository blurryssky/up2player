//
//  AVAssetExportSession+NameBox.swift
//  Kuso
//
//  Created by blurryssky on 2018/7/16.
//  Copyright © 2018年 momo. All rights reserved.
//

import AVFoundation

let defaultPresets = [AVAssetExportPreset1280x720, AVAssetExportPreset960x540, AVAssetExportPreset640x480, AVAssetExportPresetMediumQuality, AVAssetExportPresetLowQuality]

extension Up2Player where T == AVAssetExportSession {
    
    static func compatibleSession(asset: AVAsset, priorPresetName: String) -> AVAssetExportSession? {
        
        if let es = T(asset: asset, presetName: priorPresetName) {
            return es
        } else {
            
            let compatiblePresets = T.exportPresets(compatibleWith: asset)
            for defaultPreset in defaultPresets {
                guard compatiblePresets.contains(defaultPreset) else {
                    continue
                }
                return T(asset: asset, presetName: defaultPreset)
            }
            return nil
        }
    }
}
