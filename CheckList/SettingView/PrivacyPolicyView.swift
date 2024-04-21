//
//  PrivacyPolicyView.swift
//  CheckList
//
//  Created by Ryuga on 2024/04/14.
//

import SwiftUI

struct PrivacyPolicyView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("プライバシーポリシー")
                    .font(.title)
                    .bold()
                    .padding(.bottom, 5)

                Text("当社は，iOS、iPadOS上で提供するアプリ（以下,「本サービス」といいます。）における，ユーザーの個人情報の取扱いについて，以下のとおりプライバシーポリシー（以下，「本ポリシー」といいます。）を定めます。")
                    .padding(.bottom, 20)

                Group {
                    Text("第1条（個人情報）")
                        .font(.headline)
                    Text("「個人情報」とは，個人情報保護法にいう「個人情報」を指すものとし，生存する個人に関する情報であって，当該情報に含まれる氏名，生年月日，住所，電話番号，連絡先その他の記述等により特定の個人を識別できる情報及び容貌，指紋，声紋にかかるデータ，及び健康保険証の保険者番号などの当該情報単体から特定の個人を識別できる情報（個人識別情報）を指します。")
                        .padding(.bottom, 20)
                }

                Group {
                    Text("第2条（個人情報の収集方法）")
                        .font(.headline)
                    Text("当社は，ユーザーが利用登録をする際に氏名，生年月日，住所，電話番号，メールアドレス，銀行口座番号，クレジットカード番号，運転免許証番号などの個人情報をお尋ねすることがあります。また，ユーザーと提携先などとの間でなされたユーザーの個人情報を含む取引記録や決済に関する情報を,当社の提携先（情報提供元，広告主，広告配信先などを含みます。以下，｢提携先｣といいます。）などから収集することがあります。")
                        .padding(.bottom, 20)
                }

                Group {
                    Text("第3条（個人情報を収集・利用する目的）")
                        .font(.headline)
                    Text("当社が個人情報を収集・利用する目的は，以下のとおりです。")
                    Text("1. 当社サービスの提供・運営のため")
                    Text("2. ユーザーからのお問い合わせに回答するため（本人確認を行うことを含む）")
                    Text("3. ユーザーが利用中のサービスの新機能，更新情報，キャンペーン等及び当社が提供する他のサービスの案内のメールを送付するため")
                    Text("4. メンテナンス，重要なお知らせなど必要に応じたご連絡のため")
                    Text("5. 利用規約に違反したユーザーや，不正・不当な目的でサービスを利用しようとするユーザーの特定をし，ご利用をお断りするため")
                    Text("6. ユーザーにご自身の登録情報の閲覧や変更，削除，ご利用状況の閲覧を行っていただくため")
                    Text("7. 上記の利用目的に付随する目的")
                        .padding(.bottom, 20)
                }

                Group {
                    VStack(alignment: .leading) {
                        Text("第5条（個人情報の第三者提供）")
                            .font(.title2)
                            .bold()
                            .padding(.bottom, 5)

                        VStack(alignment: .leading, spacing: 10) {
                            Text("1. 当社は、次に掲げる場合を除いて、あらかじめユーザーの同意を得ることなく、第三者に個人情報を提供することはありません。ただし、個人情報保護法その他の法令で認められる場合を除きます。")
                                .padding(.bottom, 5)
                            ForEach(1..<5, id: \.self) { num in
                                HStack {
                                    Text("\(num).")
                                        .bold()
                                    Text("具体的な内容がここに入ります。")
                                }
                                .padding(.leading, 20)
                            }
                        }
                        .padding(.bottom, 20)

                        // 続く箇条書きやセクションは同様に`VStack`と`HStack`を使用してインデントを表現します。
                    }
                    .padding()
                }


                // 続く各条項を同様に追加
            }
            .padding()
        }
    }
}

#Preview {
    PrivacyPolicyView()
}
