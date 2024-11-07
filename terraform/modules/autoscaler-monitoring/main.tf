/**
 * Copyright 2024 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

resource "google_monitoring_dashboard" "dashboard" {
  project = var.project_id

  dashboard_json = templatefile("${path.module}/dashboard.json.tftpl", {
    region                   = var.region
    memorystore_cluster_name = var.memorystore_cluster_name

    cpu_average_threshold_out = var.cpu_average_threshold_out
    cpu_max_threshold_out     = var.cpu_max_threshold_out
    cpu_average_threshold_in  = var.cpu_average_threshold_in
    cpu_max_threshold_in      = var.cpu_max_threshold_in

    memory_average_threshold_out = var.memory_average_threshold_out
    memory_max_threshold_out     = var.memory_max_threshold_out
    memory_average_threshold_in  = var.memory_average_threshold_in
    memory_max_threshold_in      = var.memory_max_threshold_in
  })

  lifecycle {
    ignore_changes = [
      dashboard_json
    ]
  }
}
