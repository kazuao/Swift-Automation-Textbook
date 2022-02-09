//
//  GitHubRepositoryManagerTests.swift
//  Calc-iosTestTextTests
//
//  Created by kazunori.aoki on 2022/02/01.
//

import XCTest
@testable import Automation_Textbook

class GitHubRepositoryManagerTests: XCTestCase {

    func testMajorRepositories() {

        let testRepositories: [GitHubRepository] = [
            GitHubRepository(id: 0, star: 9, name: ""),
            GitHubRepository(id: 1, star: 10, name: ""),
            GitHubRepository(id: 2, star: 11, name: ""),
        ]

        let mockClient = MockGithubAPIClient(repositories: testRepositories)

        let manager = GitHubRepositoryManager(client: mockClient)

        manager.load(user: "apple") {
            XCTAssertEqual(mockClient.argsUser, "apple")

            XCTAssertEqual(manager.majorRepositories.count, 2)
            XCTAssertEqual(manager.majorRepositories[0].id, 1)
            XCTAssertEqual(manager.majorRepositories[1].id, 2)
        }
    }
}

class MockGithubAPIClient: GitHubAPIClientProtocol {

    // 返却するリポジトリ一覧を保持
    var returnRepositories: [GitHubRepository]
    // 呼び出された引数を保持
    var argsUser: String?

    init(repositories: [GitHubRepository]) {
        self.returnRepositories = repositories
    }

    func fetchRepositories(user: String, handler: @escaping ([GitHubRepository]?) -> Void) {
        argsUser = user
        handler(returnRepositories)
    }
}
