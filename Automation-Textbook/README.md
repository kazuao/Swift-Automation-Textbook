# iOSアプリ開発自動テストの教科書

## 自動テストを始める前に
- テストピラミッド: 単体テスト→結合テスト→UIテスト
- メソッド名
- 前処理、実行、検証、後処理
- 失敗したときの情報を出す

### 自動テストをどこから追加していくか

- テストしやすい
	- 引数のみを参照
	- 副作用を持たない
	
- 不安定なテストに向きあう
	- 不安定なテスト結果を治す
	- 違った形で担保する
	- テストケース自体を消す
	
### テストの実行時間を意識する

- 実行時間が増えた問題
	- テストの修正確認に時間がかかる
	- テストの改善がしづらくなる
	- テストの終了が待てなくなる
	
- テストの実行時間を減らす方法
	- テストピラミッドのより下部で対応する
	- 不必要なテストケースは作らない
	- テストの実行を並列化する
	
## XCTestを利用した単体テスト
- Bool
	- XCTAssertTrue()
	- XCTAssertFalse()
- Nil
	- XCTAssertNil()
	- XCTAssertNotNil()
- Equal
	- XCTAssertEqual(,)
	- XCTAssertNotEqual(,)
- 大小
	- XCTAssertGreaterThan(,)
	- XCTAssertGreaterThanOrEqual(,)
	- XCTAssertLessThanOrEqual(,)
	- XCTAssertLessThan(,)
- Fali
	- XCTFail
- Failure
	- XCTAssertThrowsError(expr, errorHnadler)
	- XCTAssertNoThrow()
	
- 第一引数に実際の値、第二引数に期待する値

- 一時的にテストを除外したい場合、関数名を変更する
	- test~~ -> xtest~~
	
- エラーメッセージを作る
	- XCTAssertEqual(calculator.add(1, 2), 4, "1 + 2 = 3 であること")
	- 第三引数に入れる（第三引数とは限らない）
	
- 独自のアサーションの作成
	- 独自に作成すれば使い回しが可能
	
### XCTestのライフサイクル
1. override class func setup()
2. override func setup()
3. <しょり>
4. override func tearDown() // test methodごとに呼ばれる
5. override func setup()
6. <しょり>
7. override func tearDown()
8. override class func tearDown()

### 非同期テスト
- XCTestExpectation

### 単体テストが書きづらいケースへの対処
- 外部環境への依存を避けるテク
	- 外部環境に依存する値を「引数」で渡す
	- プロトコルを利用してインターフェースを切り分ける
		- モック: 呼び出し結果などを記録する
		- スタブ: 任意の値を返す
		- スパイ: 本物の処理を利用しつつ、呼び出しなどの記録のみを行う
		
- 便利なコマンド
	- Edit Schemaからrandomを選ぶとテスト関数の実行順がランダムになる
	- Editor -> Code Coverageを選ぶとEditor上にコードカバレッジが表示される
	
- Coverageの見方
	- Show the Report -> Test -> Coverage


## XCUITest
- テストコード実装手順
	- XCUIApplicationを用いてアプリ起動
	- XCUIApplicationに呈して、XCUIElementQueryを使用して、UI要素（XCUIElement）を見つける
	- XCUIElementに対して行いたい操作（tapイベントなど）を行う
	- 操作した結果に対して、XCTest Assertionを使用し、UI要素などの状態をチェックする
	
- continueAfterFailure: テストコードが失敗したら処理を止めるか（def: true）

- UI要素を特定する方法
	- Accessibility Identifierを利用する
	- UI要素に表示されている文字列やUI要素の表示場所を利用する

- UITableViewにはAccessibility Identifierがないので、User Defined Runtime Attributesに設定する
	- Key Path: accessibilityIdenfier
	- Type: String
	- Value: <任意の名前>
	- もしくはソースコード上で、textField.accessilibityIdentifier = <任意の名前>

- XCUIElementTypeQueryProvider: https://developer.apple.com/documentation/xctest/xcuielementtypequeryprovider
	

## デバッグのテクニック
- break pointをダブルクリックで編集
	- Condition: 停止させる条件（i % 2 == 0など）
	- Ignore: 無視する条件（0など）
	- Action: 到達した際に実行するアクション（Log Messageなど）
	- テキストボックス: 実行するアクション
	- Automatically continue: （onで停止しない）

- Exception Breakpoint（エラー発生箇所で止まる）
	- Exception: 補足する例外の種類
	- Break: 度のタイミングで停止させるか
	- Action 実行するアクション
	- Command: 実行するデバッグコマンド

- Symbolic Breakpoint（設定した条件で止まる）
	- Symbol: 対象のシンボル名（関数名）
	- Module: 対象のモジュール（からの場合はすべて）

- Share Breakpoint（breakpointを共有する）

- 変数の値を監視
- watch point: 値が変わったタイミングで停止できる
	- １回breakで止める
	- variable viewでwatchしたい変数を右クリック
	- [Watch "x"]を設定
	- rebuildで破棄される

- memory leaks
- Instruments

- LLDB
	- continue: 実行再開
	- po: exprを評価した結果をオブジェクト自身の表現で出力する
	- p: 式を評価した結果をLLDBの表現で出力する
	- poで変数の値を変更できる
	- poでは構造体等の関数も呼び出せる
	- Viewのプロパティも動的に変更できる
		- View Hierarchyからメモリアドレスを取得する
		- $ expression -l swift -- import UIKit // UIKitをimportする
		- $ expression -l swift -- unsafe BitCast(<address>, to: UILabel.self)

- Simulatorのデバッグ機能
	- Debug > Slow Animation: アニメーションをゆっくりできる
	- Hardware > Toggle In-Call Status Bar: 着信中バーを表示する

- 実機のデバッグ機能
	- Setting > Developer > Network Link Conditioner: ネットワーク速度を変更する
	





















