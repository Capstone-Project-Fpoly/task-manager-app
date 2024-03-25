import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdmobService {
  final Ref ref;
  final String appId;
  final String bannerAdUnitId;
  final String interstitialAdUnitId;
  final String rewardedAdUnitId;

  AdmobService(
    this.ref, {
    required this.appId,
    required this.bannerAdUnitId,
    required this.interstitialAdUnitId,
    required this.rewardedAdUnitId,
  });

  BannerAd loadBannerAd() {
    return BannerAd(
      adUnitId: bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {},
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
        },
        onAdOpened: (ad) {},
        onAdClosed: (ad) {},
        onAdImpression: (ad) {},
      ),
    );
  }

  Future<void> onTapRewardedAd({required void Function(AdWithoutView, RewardItem) onUserEarnedReward,}) async {
    return RewardedAd.load(
      adUnitId: rewardedAdUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdShowedFullScreenContent: (ad) {},
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
            },
            onAdFailedToShowFullScreenContent: (ad, err) {
              ad.dispose();
            },
          );
          ad.show(
            onUserEarnedReward: onUserEarnedReward,
          );
        },
        onAdFailedToLoad: (err) {
          debugPrint('RewardedAd failed to load: $err');
        },
      ),
    );
  }
}
