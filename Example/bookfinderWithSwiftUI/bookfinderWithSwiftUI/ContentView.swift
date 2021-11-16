//
//  ContentView.swift
//  bookfinderWithSwiftUI
//
//  Created by Khyeji on 2021/11/16.
//

import SwiftUI
import Alamofire

struct ContentView: View {
    @State var books: [Book]?
    @State var searchText = ""
    // @State 값을 계속해서 유지해서 사용할 수 있음
    // struct는 계속해서 컨텐츠를 새로 만들어주기 때문에 위와 같은 조건을 걸어줌
    
    func search(){
        let apiKey = "KakaoAK 064eb33d9117d0b647840b047a0b591a"
        let strURL = "https://dapi.kakao.com/v3/search/book"
        let params: Parameters = ["query": searchText]
        let headers: HTTPHeaders = ["Authorization": apiKey]
        
        let alamo = AF.request(strURL, method: .get, parameters: params, headers: headers)
        alamo.responseDecodable(of: SResult.self) { response in
            switch response.result {
            case .success(let sresult):
                books = sresult.books
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(books ?? [], id:\.self){ book in
                        HStack{
                            AsyncImage(url: URL(string: book.thumbnail), transaction: .init(animation: .spring())) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                        .frame(width: 100)
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(3/4, contentMode: .fit)
                                        .frame(width: 100)
                                case .failure(_):
                                    EmptyView()
                                @unknown default:
                                    EmptyView()
                                }
                            }
//                            Image("cat1")
//                                .resizable()
//                                .aspectRatio(2/3, contentMode: .fit)
//                                .frame(height: 100)
                            VStack (alignment: .leading){
                                Text(book.title)
                                    .font(.title3)
                                    .foregroundColor(.blue)
                                    .fontWeight(.heavy)
                                Text(book.authors.joined(separator: ", "))
                                    .font(.body)
                                    .bold()
                                    .foregroundColor(.gray)
                                    .padding(.vertical, 1)
                                HStack{
                                    Text(book.publisher)
                                    Spacer()
                                    Text("\(book.price)원")
                                }
                            }
                        }
                    }
                }
                
                .searchable(text: $searchText, prompt: "검색어를 입력하세요.")
                // 언제 검색을 시작하냐
                .onSubmit(of: .search, search)
                
                //            Button(action: search) {
                //                Text("검색")
                //            }
                //            .padding()
            }
        }
    }
}

// 앱을 실행하는데 아무런 영향을 미치지 않고, preview를 보여주는 것임
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
