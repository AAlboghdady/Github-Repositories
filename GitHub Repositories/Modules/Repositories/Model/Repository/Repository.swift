/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation

struct Repository : Codable {
	var id : Int?
	var node_id : String?
	var name : String?
	var full_name : String?
	var `private` : Bool?
	var owner : Owner?
	var html_url : String?
	var description : String?
	var fork : Bool?
	var url : String?
	var forks_url : String?
	var keys_urls_url : String?
	var collaborators_url : String?
	var teams_url : String?
	var hooks_url : String?
	var issue_events_url : String?
	var events_url : String?
	var assignees_url : String?
	var branches_url : String?
	var tags_url : String?
	var blobs_url : String?
	var git_tags_url : String?
	var git_refs_url : String?
	var trees_url : String?
	var statuses_url : String?
	var languages_url : String?
	var stargazers_url : String?
	var contributors_url : String?
	var subscribers_url : String?
	var subscription_url : String?
	var commits_url : String?
	var git_commits_url : String?
	var comments_url : String?
	var issue_comment_url : String?
	var contents_url : String?
	var compare_url : String?
	var merges_url : String?
	var archive_url : String?
	var downloads_url : String?
	var issues_url : String?
	var pulls_url : String?
	var milestones_url : String?
	var notifications_url : String?
	var labels_url : String?
	var releases_url : String?
	var deployments_url : String?
    var created_at : String?
    var updated_at : String?
    
    init() {}
}
