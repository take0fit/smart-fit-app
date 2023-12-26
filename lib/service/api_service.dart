import 'package:get/get_connect/connect.dart';
import 'package:smart_fit/model/body_part_summary.dart';
import 'package:smart_fit/model/gym_detail.dart';
import 'package:smart_fit/model/gym_summary.dart';
import 'package:smart_fit/model/machine_summary.dart';

class ApiService extends GetConnect {
  static const _commonHeaders = {
    'content-type': 'application/json',
    'Accept': 'application/json',
  };

  Future<List<String>> getHomeImages() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8R3ltfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=700&q=60',
      'https://images.unsplash.com/photo-1517836357463-d25dfeac3438?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8R3ltfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=700&q=60',
      'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8R3ltfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=700&q=60',
      'https://images.unsplash.com/photo-1605296867304-46d5465a13f1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fEd5bXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=700&q=60',
      'https://images.unsplash.com/photo-1558611848-73f7eb4001a1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fEd5bXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=700&q=60',
      'https://images.unsplash.com/photo-1518310952931-b1de897abd40?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTJ8fEd5bXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=700&q=60',
    ];
  }

  Future<List<GymSummary>> getContractedGyms() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      GymSummary(
        id: 1,
        name: "SmartFit GYM 渋谷店",
        imageUrl:
            "https://images.unsplash.com/photo-1593079831268-3381b0db4a77?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2938&q=80",
        numberOfUsers: 30,
      ),
      GymSummary(
        id: 2,
        name: "SmartFit GYM 恵比寿店",
        imageUrl:
            "https://images.unsplash.com/photo-1571902943202-507ec2618e8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8R3ltfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=700&q=60",
        numberOfUsers: 40,
      )
    ];
  }

  Future<List<GymSummary>> getRecommendedGyms() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      GymSummary(
        id: 1,
        name: "SmartFit GYM 渋谷店",
        imageUrl:
            "https://images.unsplash.com/photo-1593079831268-3381b0db4a77?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2938&q=80",
        numberOfUsers: 30,
      ),
      GymSummary(
        id: 2,
        name: "SmartFit GYM 恵比寿店",
        imageUrl:
            "https://images.unsplash.com/photo-1571902943202-507ec2618e8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8R3ltfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=700&q=60",
        numberOfUsers: 40,
      )
    ];
  }

  Future<List<GymSummary>> getFavoriteGyms() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      GymSummary(
        id: 1,
        name: "SmartFit GYM 渋谷店",
        imageUrl:
            "https://images.unsplash.com/photo-1593079831268-3381b0db4a77?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2938&q=80",
        numberOfUsers: 30,
      ),
      GymSummary(
        id: 2,
        name: "SmartFit GYM 恵比寿店",
        imageUrl:
            "https://images.unsplash.com/photo-1571902943202-507ec2618e8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8R3ltfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=700&q=60",
        numberOfUsers: 40,
      )
    ];
  }

  Future<List<MachineSummary>> getMachines() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      MachineSummary(
        id: 1,
        name: "チェストプレスマシン",
        imageUrl:
            "https://images.unsplash.com/photo-1593079831268-3381b0db4a77?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2938&q=80",
      ),
      MachineSummary(
        id: 2,
        name: "べンチプレス台1",
        imageUrl:
            "https://images.unsplash.com/photo-1571902943202-507ec2618e8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8R3ltfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=700&q=60",
      ),
      MachineSummary(
        id: 3,
        name: "べンチプレス台2",
        imageUrl:
            "https://images.unsplash.com/photo-1571902943202-507ec2618e8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8R3ltfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=700&q=60",
      ),
      MachineSummary(
        id: 4,
        name: "スミスマシン",
        imageUrl:
            "https://images.unsplash.com/photo-1571902943202-507ec2618e8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8R3ltfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=700&q=60",
      ),
      MachineSummary(
        id: 5,
        name: "フラットベンチ",
        imageUrl:
            "https://images.unsplash.com/photo-1571902943202-507ec2618e8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8R3ltfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=700&q=60",
      ),
      MachineSummary(
        id: 6,
        name: "インクライン＆デクラインベンチ",
        imageUrl:
            "https://images.unsplash.com/photo-1571902943202-507ec2618e8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8R3ltfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=700&q=60",
      ),
      MachineSummary(
        id: 7,
        name: "ペックフライマシン",
        imageUrl:
            "https://images.unsplash.com/photo-1571902943202-507ec2618e8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8R3ltfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=700&q=60",
      ),
      MachineSummary(
        id: 8,
        name: "インクラインチェストプレスマシン",
        imageUrl:
            "https://images.unsplash.com/photo-1571902943202-507ec2618e8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8R3ltfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=700&q=60",
      ),
    ];
  }

  Future<GymDetail> getGym() async {
    await Future.delayed(const Duration(seconds: 1));
    return GymDetail(
      id: 1,
      name: "SmartFit GYM 渋谷店",
      imageUrls:[
        "https://images.unsplash.com/photo-1593079831268-3381b0db4a77?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2938&q=80",
        "https://images.unsplash.com/photo-1593079831268-3381b0db4a77?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2938&q=80",
        "https://images.unsplash.com/photo-1593079831268-3381b0db4a77?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2938&q=80",
        "https://images.unsplash.com/photo-1593079831268-3381b0db4a77?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2938&q=80",
        "https://images.unsplash.com/photo-1593079831268-3381b0db4a77?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2938&q=80",
      ],
      numberOfUsers: 40,
      address: "東京都渋谷区道玄坂1-1-1 Aビル101",
      area: "渋谷・恵比寿エリア",
      businessHours: "24h営業",
      monthlyAmount: 10000,
      isFavorite: true,
    );
  }
  Future<List<BodyPartSummary>> getBodyParts() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      BodyPartSummary(
        id: 1,
        name: "胸",
      ),
      BodyPartSummary(
        id: 2,
        name: "肩",
      ),
      BodyPartSummary(
        id: 2,
        name: "肩",
      ),
      BodyPartSummary(
        id: 2,
        name: "肩",
      ),
      BodyPartSummary(
        id: 2,
        name: "肩",
      ),
      BodyPartSummary(
        id: 2,
        name: "肩",
      ),
      BodyPartSummary(
        id: 2,
        name: "肩",
      ),
    ];
  }
}

class ApiException implements Exception {
  ApiException(this.message);

  final String message;
}
