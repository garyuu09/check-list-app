//
//  TermsOfServiceView.swift
//  CheckList
//
//  Created by Ryuga on 2024/04/14.
//

import SwiftUI

struct TermsOfServiceView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("利用規約")
                    .font(.title)
                    .bold()
                    .padding(.bottom, 5)

                Text("この利用規約（以下，「本規約」といいます。）は，当社がこの上で提供するサービス（以下，「本サービス」といいます。）の利用条件を定めるものです。ユーザーの皆さま（以下，「ユーザー」といいます。）には，本規約に従って，本サービスをご利用いただきます。")
                    .padding(.bottom, 20)

                Group {
                    VStack(alignment: .leading) {
                        Text("第1条（適用）")
                            .font(.headline)
                            .bold()
                            .padding(.bottom, 5)

                        VStack(alignment: .leading, spacing: 0) {
                            HStack(alignment: .top) {
                                Text("1.")
                                    .bold()
                                Text("本規約は，ユーザーと当社との間の本サービスの利用に関わる一切の関係に適用されるものとします。")
                            }
                            HStack(alignment: .top) {
                                Text("2.")
                                    .bold()
                                Text("当社は本サービスに関し，本規約のほか，ご利用にあたってのルール等，各種の定め（以下，「個別規定」といいます。）をすることがあります。これら個別規定はその名称のいかんに関わらず，本規約の一部を構成するものとします。")
                            }
                            HStack(alignment: .top) {
                                Text("3.")
                                    .bold()
                                Text("本規約の規定が前条の個別規定の規定と矛盾する場合には，個別規定において特段の定めなき限り，個別規定の規定が優先されるものとします。")
                            }
                        }
                        .padding(.bottom, 20)
                    }
                }

                Group {
                    VStack(alignment: .leading) {
                        Text("第2条（禁止事項）")
                            .font(.headline)
                            .bold()
                            .padding(.bottom, 5)

                        VStack(alignment: .leading, spacing: 0) {
                            Text("ユーザーは，本サービスの利用にあたり，以下の行為をしてはなりません。")
                                .padding(.bottom, 5)
                            HStack(alignment: .top) {
                                Text("1.")
                                    .bold()
                                Text("法令または公序良俗に違反する行為")
                            }
                            HStack(alignment: .top) {
                                Text("2.")
                                    .bold()
                                Text("犯罪行為に関連する行為")
                            }
                            HStack(alignment: .top) {
                                Text("3.")
                                    .bold()
                                Text("本サービスの内容等，本サービスに含まれる著作権，商標権ほか知的財産権を侵害する行為")
                            }
                            HStack(alignment: .top) {
                                Text("4.")
                                    .bold()
                                Text("当社，ほかのユーザー，またはその他第三者のサーバーまたはネットワークの機能を破壊したり，妨害したりする行為")
                            }
                            HStack(alignment: .top) {
                                Text("5.")
                                    .bold()
                                Text("本サービスによって得られた情報を商業的に利用する行為")
                            }
                            HStack(alignment: .top) {
                                Text("6.")
                                    .bold()
                                Text("当社のサービスの運営を妨害するおそれのある行為")
                            }
                            HStack(alignment: .top) {
                                Text("7.")
                                    .bold()
                                Text("不正アクセスをし，またはこれを試みる行為")
                            }
                            HStack(alignment: .top) {
                                Text("8.")
                                    .bold()
                                Text("他のユーザーに関する個人情報等を収集または蓄積する行為")
                            }
                            HStack(alignment: .top) {
                                Text("9.")
                                    .bold()
                                Text("不正な目的を持って本サービスを利用する行為")
                            }
                            HStack(alignment: .top) {
                                Text("10.")
                                    .bold()
                                Text("本サービスの他のユーザーまたはその他の第三者に不利益，損害，不快感を与える行為")
                            }
                            HStack(alignment: .top) {
                                Text("11.")
                                    .bold()
                                Text("他のユーザーに成りすます行為")
                            }
                            HStack(alignment: .top) {
                                Text("12.")
                                    .bold()
                                Text("当社が許諾しない本サービス上での宣伝，広告，勧誘，または営業行為")
                            }
                            HStack(alignment: .top) {
                                Text("13.")
                                    .bold()
                                Text("面識のない異性との出会いを目的とした行為")
                            }
                            HStack(alignment: .top) {
                                Text("14.")
                                    .bold()
                                Text("当社のサービスに関連して，反社会的勢力に対して直接または間接に利益を供与する行為")
                            }
                            HStack(alignment: .top) {
                                Text("15.")
                                    .bold()
                                Text("その他，当社が不適切と判断する行為")
                            }
                        }
                        .padding(.bottom, 20)
                    }
                }



                Group {
                    Text("第3条（本サービスの提供の停止等）")
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
    TermsOfServiceView()
}
