include("pdre_api_helpers.jl")
include("./fixtures/pdre_api_dataset.jl")
include("./fixtures/pdre_api_results.jl")

using Test

@testset "PDRE API Tests **LEGACY**" begin
    script_dir = @__DIR__
    root_dir = script_dir * "/.."
    cd(root_dir)

    # ## Test crypto hashing and key functions
    run_dataset(
        PdreApiTestFunctionsLegacy.value,
        [
            PdreApiTestData.value
        ],
        PdreApiTestBinariesLegacy.cli_testers,
        PdreApiExpectedResultsLegacy.value
    )

    # ## Test crypto key functions
    run_dataset(
        PdreApiTestFunctionsLegacy.value_no_output,
        [
            PdreApiTestData.value
        ],
        PdreApiTestBinariesLegacy.cli_testers,
        false
    )

    # ## Test key/value storage functions
    run_dataset(
        PdreApiTestFunctionsLegacy.key_value,
        [
            PdreApiTestData.key_value_1
        ],
        PdreApiTestBinariesLegacy.cli_testers,
        PdreApiExpectedResultsLegacy.key_value
    )

    # ## Test key/value storage functions with offsets
    run_dataset(
        PdreApiTestFunctionsLegacy.key_value_offset,
        [
            PdreApiTestData.key_value_1,
            PdreApiTestData.offset
        ],
        PdreApiTestBinariesLegacy.cli_testers,
        PdreApiExpectedResultsLegacy.key_value_offset
    )

    # ## Test multipl key/value storage functions
    run_dataset(
        PdreApiTestFunctionsLegacy.key_value_key_value,
        [
            PdreApiTestData.key_value_1,
            PdreApiTestData.key_value_2
        ],
        PdreApiTestBinariesLegacy.cli_testers,
        PdreApiExpectedResultsLegacy.key_value_key_value
    )

    # ## Test compare/set storage functions
    run_dataset(
        PdreApiTestFunctionsLegacy.key_key_value,
        [
            PdreApiTestData.key_value_1,
            PdreApiTestData.value
        ],
        PdreApiTestBinariesLegacy.cli_testers,
        PdreApiExpectedResultsLegacy.key_key_value
    )

    # ## Test storage functions (prefix values)
    run_dataset(
        PdreApiTestFunctionsLegacy.prefix_key_value_key_value,
        [
            PdreApiTestData.prefix_key_value_key_value
        ],
        PdreApiTestBinariesLegacy.cli_testers,
        false
    )

    # ## Test storage functions (child storage)
    run_dataset(
        PdreApiTestFunctionsLegacy.child_child_key_value,
        [
            PdreApiTestData.child_child,
            PdreApiTestData.key_value_1
        ],
        PdreApiTestBinariesLegacy.cli_testers,
        PdreApiExpectedResultsLegacy.child_child_key_value
    )

    # ## Test child storage function with offsets
    run_dataset(
        PdreApiTestFunctionsLegacy.child_child_key_value_key_value,
        [
            PdreApiTestData.child_child,
            PdreApiTestData.key_value_1,
            PdreApiTestData.key_value_2
        ],
        PdreApiTestBinariesLegacy.cli_testers,
        PdreApiExpectedResultsLegacy.child_child_key_value_key_value
    )

    # ## Test storage functions (prefix values on child storage)
    run_dataset(
        PdreApiTestFunctionsLegacy.prefix_child_child_key_value_key_value,
        [
            PdreApiTestData.child_child,
            PdreApiTestData.prefix_key_value_key_value
        ],
        PdreApiTestBinariesLegacy.cli_testers,
        false
    )

    # ## Test storage functions with offsets
    run_dataset(
        PdreApiTestFunctionsLegacy.child_child_key_value_offset,
        [
            PdreApiTestData.child_child,
            PdreApiTestData.key_value_1,
            PdreApiTestData.offset
        ],
        PdreApiTestBinariesLegacy.cli_testers,
        PdreApiExpectedResultsLegacy.child_child_key_value_offset
    )

    # ## Test network functions
    for func in PdreApiTestFunctionsLegacy.fn_network
        for cli in PdreApiTestBinariesLegacy.cli_testers
            # ...
        end
    end

    cd(root_dir)
end
