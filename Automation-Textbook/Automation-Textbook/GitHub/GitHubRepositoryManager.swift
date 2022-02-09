//
//  GitHubRepositoryManager.swift
//  Calc-iosTestText
//
//  Created by kazunori.aoki on 2022/02/01.
//

import Foundation

final class GitHubRepositoryManager {

    private let client: GitHubAPIClientProtocol
    private var repos: [GitHubRepository]?

    var majorRepositories: [GitHubRepository] {
        guard let repositories = self.repos else { return [] }
        return repositories.filter { $0.star >= 10 }
    }

    init(client: GitHubAPIClientProtocol = GitHubAPIClient()) {
        self.client = client
    }

    func load(user: String, completion: @escaping () -> Void) {
        client.fetchRepositories(user: user) { repositories in
            self.repos = repositories
            completion()
        }
    }
}
